// Generated by gencpp from file sha/sha.msg
// DO NOT EDIT!


#ifndef SHA_MESSAGE_SHA_H
#define SHA_MESSAGE_SHA_H


#include <string>
#include <vector>
#include <memory>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>


namespace sha
{
template <class ContainerAllocator>
struct sha_
{
  typedef sha_<ContainerAllocator> Type;

  sha_()
    : old_framescore_pub(0.0)
    , old_variance_pub(0.0)  {
    }
  sha_(const ContainerAllocator& _alloc)
    : old_framescore_pub(0.0)
    , old_variance_pub(0.0)  {
  (void)_alloc;
    }



   typedef double _old_framescore_pub_type;
  _old_framescore_pub_type old_framescore_pub;

   typedef double _old_variance_pub_type;
  _old_variance_pub_type old_variance_pub;





  typedef boost::shared_ptr< ::sha::sha_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::sha::sha_<ContainerAllocator> const> ConstPtr;

}; // struct sha_

typedef ::sha::sha_<std::allocator<void> > sha;

typedef boost::shared_ptr< ::sha::sha > shaPtr;
typedef boost::shared_ptr< ::sha::sha const> shaConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::sha::sha_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::sha::sha_<ContainerAllocator> >::stream(s, "", v);
return s;
}


template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator==(const ::sha::sha_<ContainerAllocator1> & lhs, const ::sha::sha_<ContainerAllocator2> & rhs)
{
  return lhs.old_framescore_pub == rhs.old_framescore_pub &&
    lhs.old_variance_pub == rhs.old_variance_pub;
}

template<typename ContainerAllocator1, typename ContainerAllocator2>
bool operator!=(const ::sha::sha_<ContainerAllocator1> & lhs, const ::sha::sha_<ContainerAllocator2> & rhs)
{
  return !(lhs == rhs);
}


} // namespace sha

namespace ros
{
namespace message_traits
{





template <class ContainerAllocator>
struct IsMessage< ::sha::sha_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::sha::sha_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sha::sha_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::sha::sha_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sha::sha_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::sha::sha_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::sha::sha_<ContainerAllocator> >
{
  static const char* value()
  {
    return "6d9c7de78367f107912b0affe8137d22";
  }

  static const char* value(const ::sha::sha_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x6d9c7de78367f107ULL;
  static const uint64_t static_value2 = 0x912b0affe8137d22ULL;
};

template<class ContainerAllocator>
struct DataType< ::sha::sha_<ContainerAllocator> >
{
  static const char* value()
  {
    return "sha/sha";
  }

  static const char* value(const ::sha::sha_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::sha::sha_<ContainerAllocator> >
{
  static const char* value()
  {
    return "float64 old_framescore_pub\n"
"float64 old_variance_pub\n"
;
  }

  static const char* value(const ::sha::sha_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::sha::sha_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.old_framescore_pub);
      stream.next(m.old_variance_pub);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct sha_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::sha::sha_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::sha::sha_<ContainerAllocator>& v)
  {
    s << indent << "old_framescore_pub: ";
    Printer<double>::stream(s, indent + "  ", v.old_framescore_pub);
    s << indent << "old_variance_pub: ";
    Printer<double>::stream(s, indent + "  ", v.old_variance_pub);
  }
};

} // namespace message_operations
} // namespace ros

#endif // SHA_MESSAGE_SHA_H