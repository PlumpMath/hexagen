  /*****\\\\
 /       \\\\    Swift/Generator.swift
/  /\ /\  \\\\   (part of Hexagen)
\  \_X_/  ////
 \       ////    Copyright © 2015 Alice Atlas (see LICENSE.md)
  \*****////


public class Gen<OutType>: Coro<Void, OutType>, SequenceType, GeneratorType {
    override public init(_ fn: (OutType -> Void) -> Void) {
        super.init(fn)
    }
    
    public func generate() -> Gen {
        return self
    }
    
    public func next() -> OutType? {
        return _started ? send(()) : start()
    }
    
    public func map<U>(fn: OutType -> U) -> LazySequence<MapSequenceView<Gen, U>> {
        return lazy(self).map(fn)
    }
    
    public func filter(fn: OutType -> Bool) -> LazySequence<FilterSequenceView<Gen>> {
        return lazy(self).filter(fn)
    }
}