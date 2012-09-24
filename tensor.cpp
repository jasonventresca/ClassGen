/**
 * @file    tensor.cpp
 * @author  Jason Ventresca
 * @brief   Brief description goes here
 */

#include "tensor.h"

namespace Math
{

/**
 * operator<<
 * @param   (std::ostream&) lhs
 * @param   (const Tensor&) rhs
 * @return  (std::ostream&)
 */
std::ostream& operator<<(std::ostream& lhs, const Tensor& rhs)
{
  lhs << "Contents of Tensor object:" << std::endl;
  
  return lhs;
}

} // namespace Math

