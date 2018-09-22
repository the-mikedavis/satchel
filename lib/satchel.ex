defmodule Satchel do
  @moduledoc """
  Satchel is a library for serializing and de-serializing values. Currently,
  only little endian is supported (for my own convenience). The following
  types are supported:

  * `bool` (unsigned 8-bit int)
  * `int8`
  * `uint8`
  * `int16`
  * `uint16`
  * `int32`
  * `uint32`
  * `int64`
  * `uint64`
  * `float32`
  * `float64`
  * `string`
  * `time`, a tuple of secs and nsecs where both are `uint32`s.
  * `duration`, a tuple of secs and nsecs where both are `int32`s.
  """

  # TODO examples in @doc tag
  @doc """
  Pack an Elixir value as a binary.
  """
  @spec pack(any(), atom()) :: binary()
  def pack(data, type)

  def pack(b, :bool), do: <<b::unsigned-little-integer-8>>

  def pack(n, :int8), do: <<n::signed-little-integer-8>>
  def pack(n, :uint8), do: <<n::unsigned-little-integer-8>>
  def pack(n, :int16), do: <<n::signed-little-integer-16>>
  def pack(n, :uint16), do: <<n::unsigned-little-integer-16>>
  def pack(n, :int32), do: <<n::signed-little-integer-32>>
  def pack(n, :uint32), do: <<n::unsigned-little-integer-32>>
  def pack(n, :int64), do: <<n::signed-little-integer-64>>
  def pack(n, :uint64), do: <<n::unsigned-little-integer-64>>

  def pack(f, :float32), do: <<f::signed-little-float-32>>
  def pack(f, :float64), do: <<f::signed-little-float-64>>

  def pack(str, :string), do: str

  def pack({secs, nsecs}, :time),
    do: <<secs::unsigned-little-integer-32, nsecs::unsigned-little-integer-32>>

  def pack({secs, nsecs}, :duration),
    do: <<secs::signed-little-integer-32, nsecs::signed-little-integer-32>>

  # TODO examples in @doc tag
  @doc """
  Unpack a binary value.
  """
  @spec unpack(binary(), atom()) :: any()
  def unpack(data, type)

  def unpack(<<b::unsigned-little-integer-8>>, :bool), do: b == 1

  def unpack(<<n::signed-little-integer-8>>, :int8), do: n
  def unpack(<<n::unsigned-little-integer-8>>, :uint8), do: n
  def unpack(<<n::signed-little-integer-16>>, :int16), do: n
  def unpack(<<n::unsigned-little-integer-16>>, :uint16), do: n
  def unpack(<<n::signed-little-integer-32>>, :int32), do: n
  def unpack(<<n::unsigned-little-integer-32>>, :uint32), do: n
  def unpack(<<n::signed-little-integer-64>>, :int64), do: n
  def unpack(<<n::unsigned-little-integer-64>>, :uint64), do: n

  def unpack(<<f::signed-little-float-32>>, :float32), do: f
  def unpack(<<f::signed-little-float-64>>, :float64), do: f

  def unpack(str, :string), do: str

  def unpack(
        <<secs::unsigned-little-integer-32, nsecs::unsigned-little-integer-32>>,
        :time
      ),
      do: {secs, nsecs}

  def unpack(
        <<secs::signed-little-integer-32, nsecs::signed-little-integer-32>>,
        :duration
      ),
      do: {secs, nsecs}
end
