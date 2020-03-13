import 'package:equatable/equatable.dart';

abstract class TopScreenState extends Equatable {
  const TopScreenState();
}

class TopScreenEmpty extends TopScreenState {
  @override
  List<Object> get props => [];
}

class TopScreenLoading extends TopScreenState {
  @override
  List<Object> get props => [];
}

class TopScreenPopulated extends TopScreenState {
  @override
  List<Object> get props => [];
}

class TopScreenInserting extends TopScreenState {
  @override
  List<Object> get props => [];
}

class TopScreenInserted extends TopScreenState {
  @override
  List<Object> get props => [];
}

class TopScreenNotInserted extends TopScreenState {
  @override
  List<Object> get props => [];
}
