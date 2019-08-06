#pragma once

class SomeClass {
private:
  int *data;
  void set_value(int value);
  int get_value();

public:
  SomeClass();
  ~SomeClass();
  void setValue(int value);
  int getValue();
};
