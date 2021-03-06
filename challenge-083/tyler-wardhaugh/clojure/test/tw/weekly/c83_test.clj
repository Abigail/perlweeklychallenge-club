(ns tw.weekly.c83-test
  (:require [clojure.test :refer [deftest is testing]]
            [tw.weekly.c83.t1 :refer [inner-words-length]]
            [tw.weekly.c83.t2 :refer [flip-array]]))

(deftest task-1
  (testing "Task 1, Words Length"
    (is (= (inner-words-length "The Weekly Challenge") 6))
    (is (= (inner-words-length  "The purpose of our lives is to be happy") 23))
    (is (= (inner-words-length  "Zero when-no-inner-words-exist!") 0))))

(deftest task-2
  (testing "Task 2, Flip Array"
    (is (= (flip-array [3 10 8]) 1))
    (is (= (flip-array [12 2 10]) 1))))
