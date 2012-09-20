#ifndef TENSOR_H
#define TENSOR_H
/**
 * @file    tensor.h
 * @author  Jason Ventresca
 * @brief   Brief description goes here
 */

#include <iostream>

namespace Math
{

class Tensor
{
public:
  /**
   * Orthodox Canonical Form (OCF) member functions
   */

  /**
   * Default Constructor
   */
  Tensor()
  {

  }

  /**
   * Copy Constructor
   */
  Tensor(const Tensor& copy)
  {

  }

  /**
   * Destructor
   */
  ~Tensor()
  {

  }

  /**
   * Copy Assignment Operator
   */
  Tensor& operator=(const Tensor& rhs)
  {
    /**
     * perform deep copy -- consider moving to implementation file to prevent
     * the compiler from inlining this function if it gets heavy
     */

    return *this;
  }

private:
  friend std::ostream& operator<<(std::ostream&, const Tensor&);

}; // class Tensor

} // namespace Math

#endif // include guard TENSOR_H

