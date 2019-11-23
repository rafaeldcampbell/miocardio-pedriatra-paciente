class Reminder{
  int id;
  String name; //nome do medicamento
  int dose; //dose
  String doseMetric; //metrica da dose Ex.:comprimido, ml etc.
  int time; //periodicidade
  String timeMetric; //metrica de tempo Ex.: horas, dias etc;
  int begining; //inicio do tratamento
  int end; //fim do tratamento (pode ser nulo)

  Reminder({this.id, 
            this.name, 
            this.dose, 
            this.doseMetric, 
            this.time, 
            this.timeMetric, 
            this.begining, 
            this.end});
    
  //recupera do banco para um novo objeto
  factory Reminder.fromMap(Map<String, dynamic> db) => new Reminder(
        id: db["id"],
        name: db["name"],
        dose: db["dose"],
        doseMetric: db["doseMetric"],
        time: db["time"],
        timeMetric: db["name"],
        begining: db["begining"],
        end: db["end"],
      );

  //define o mapeamento do objeto para o banco
  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "dose": dose,
        "doseMetric": doseMetric,
        "time": time,
        "timeMetric": timeMetric,
        "begining": begining,
        "end": end,
      };
}