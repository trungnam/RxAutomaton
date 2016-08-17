//
//  Reply.swift
//  RxAutomaton
//
//  Created by Yasuhiro Inami on 2016-08-15.
//  Copyright © 2016 Yasuhiro Inami. All rights reserved.
//

public enum Reply<State, Input>
{
    /// Transition success, i.e. `(input, fromState, toState)`.
    case Success(Input, State, State)

    /// Transition failure, i.e. `(input, fromState)`.
    case Failure(Input, State)

    public var input: Input
    {
        switch self {
            case let .Success(input, _, _): return input
            case let .Failure(input, _): return input
        }
    }

    public var fromState: State
    {
        switch self {
            case let .Success(_, fromState, _): return fromState
            case let .Failure(_, fromState): return fromState
        }
    }

    public var toState: State?
    {
        switch self {
            case let .Success(_, _, toState): return toState
            case .Failure: return nil
        }
    }
}
