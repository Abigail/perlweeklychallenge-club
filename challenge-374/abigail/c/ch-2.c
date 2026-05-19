# include <stdlib.h>
# include <stdio.h>

# define NUL '\0'

int main (int argc, char ** argv) {
    char *  line    = NULL;
    size_t  linecap = 0;
    ssize_t linelen;
    while ((linelen = getline (&line, &linecap, stdin)) > 0) {
        char max_ch = '0';
        int  max_l  =  0;
        char * ptr  = line;

        char cur_ch = NUL;   /* Current digit in sequence */
        int  cur_l  =  0;    /* and its length            */
        while (* ptr) {
            if (* ptr == cur_ch) {
                cur_l ++;
            }
            else {
                /*
                 * Different character; update max if "better", where
                 * better means either a longer sequence, or the same
                 * length sequence but a larger digit. But ignore sequences
                 * of 0s 
                 *
                 * Note that we also drop here if * ptr == '\n', which is
                 * exactly what we want -- this updates (if necessary)
                 * max_ch and max_l, and then * ptr becomes NUL, terminating
                 * the loop
                 */
                if (cur_ch != '0' &&
                   (cur_l  >  max_l || cur_l == max_l && cur_ch > max_ch)) {
                    max_ch = cur_ch;
                    max_l  = cur_l;
                }
                cur_ch = * ptr; /* Start a new sequence */
                cur_l  = 1;
            }
            ptr ++;
        }
        /* Special case for a string consisting of just 0's */
        if (max_ch == '0') {
            max_l = 1;
        }
        /* Print results */
        for (int i = 0; i < max_l; i ++) {
            printf ("%c", max_ch);
        }
        printf ("\n");
    }
    free (line);
    exit (0);
}
