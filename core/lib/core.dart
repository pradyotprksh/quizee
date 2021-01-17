/// A core module to separate the business logic from the view. This will make
/// our view module cleaner. And any change in the core module will not affect
/// the view until and unless its made explicitly. This is useful also when
/// more people are working in the project. So one/more will be handling the
/// core module and other will be working in the other part. And there will be
/// no affect in the other module.

library core;

export 'src/bindings/bindings.dart';
export 'src/bloc/bloc.dart';
export 'src/interface/interface.dart';
export 'src/models/model.dart';
export 'src/repository/repository.dart';
export 'src/services/services.dart';
export 'src/utils/utils.dart';
