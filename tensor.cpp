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
 * @param   (std::ostream&) os
 * @param   (const Tensor&) tensor
 * @return  (std::ostream&)
 */
std::ostream& operator<<(std::ostream& os, const Tensor& tensor)
{
  os << "Contents of Tensor object:" << std::endl;
  
  return os;
}

} // namespace Math

