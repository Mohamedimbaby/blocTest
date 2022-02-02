import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_concepts/cubit/counter_cubit.dart';
import 'package:test/test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });

    tearDown(() {
      counterCubit.close();
    });
    test("test initial test ", (){
      expect(counterCubit.state , CounterState(counterValue: 0));
    });
    blocTest("test when push increment event",
        build: ()=>counterCubit,
      act: (CounterCubit cubit){
      cubit.increment();
      },
      expect: (){
      return [
        CounterState(counterValue: 1, wasIncremented: true)
      ];
      }

    );
    blocTest("decrement event", build:(){
      return counterCubit;
    } ,
    act: (CounterCubit cubit){
      cubit.decrement();
    },
      expect: (){
      return [
        CounterState(counterValue: -1, wasIncremented: false)
      ];
      }
    );



  });
}
