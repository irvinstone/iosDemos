//
//  UIButton.swift
//  iOsdemos
//
//  Created by Irvin Leon on 17/09/22.
//

import UIKit
import Combine
import Foundation

//extension UIButton {
//    
//    func tapPublisher() -> AnyPublisher<Void, Never> {
//        self.publisher(for: .touchUpInside)
//            .map({ _ in
//                return
//            })
//            .eraseToAnyPublisher()
//    }
//    
//}

//extension UIControl {
//
//    //use like: textField.publisher(for: .editingChanged)
//    func publisher(for event: UIControl.Event) -> UIControl.EventPublisher {
//        return UIControl.EventPublisher(control: self, controlEvent: event)
//    }
//
//    // creating a publisher for the UIControl
//    struct EventPublisher: Publisher {
//
//        typealias Output = UIControl // we are passing in the data stream the uicontrol as value
//        typealias Failure = Never
//
//        let control: UIControl
//        let controlEvent: UIControl.Event
//
//        func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
//            let subscription = EventSubscription(control: control, event: controlEvent, subscriber: subscriber)
//            subscriber.receive(subscription: subscription)
//        }
//    }
//
//    // the subscription is where the main work is done
//    class EventSubscription<S: Subscriber>: Subscription
//    where S.Input == UIControl, S.Failure == Never {
//
//        let control: UIControl
//        let event: UIControl.Event
//        var subscriber: S?
//
//        var currentDemand = Subscribers.Demand.none
//
//        init(control: UIControl, event: UIControl.Event, subscriber: S) {
//            self.control = control
//            self.event = event
//            self.subscriber = subscriber
//
//            control.addTarget(self,
//                              action: #selector(eventOccured),
//                              for: event)
//        }
//
//        func request(_ demand: Subscribers.Demand) {
//            currentDemand += demand
//        }
//
//        func cancel() {
//            subscriber = nil
//            control.removeTarget(self,
//                                 action: #selector(eventOccured),
//                                 for: event)
//        }
//
//        @objc func eventOccured() {
//            if currentDemand > 0 {
//                currentDemand += subscriber?.receive(control) ?? .none
//                currentDemand -= 1
//            }
//        }
//    }
//}

extension UITextField {
    
    func textPublisher() -> AnyPublisher<String, Never> {
        NotificationCenter.default
            .publisher(for: UITextField.textDidChangeNotification, object: self)
            .compactMap({ ($0.object as? UITextField)?.text })
            .eraseToAnyPublisher()
    }
    
    func createBinding(with subject: CurrentValueSubject<String, Never>,
                       storeIn subscriptions: inout Set<AnyCancellable>) {
        
        subject.sink { [weak self] (value) in
            if value != self?.text {
                self?.text = value
            }
        }.store(in: &subscriptions)
        
        self.textPublisher().sink { (value) in
            if value != subject.value {
                subject.send(value)
            }
        }.store(in: &subscriptions)
    }
}
