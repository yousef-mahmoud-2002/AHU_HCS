class TraineeModel {
  final String traineeId;
  final String traineeName;

  TraineeModel({
    required this.traineeId,
    required this.traineeName,
  });

  factory TraineeModel.fromSql(resopnse) {
    return TraineeModel(
      traineeId: resopnse['traineeId'],
      traineeName: resopnse['traineeName'],
    );
  }
}
