class Reminder{
  int id;
  String name; //nome do medicamento
  int dose; //dose
  String doseMetric; //metrica da dose Ex.:comprimido, ml etc.
  int time; //periodicidade (em milisegundos)
  String obs; //Observações sobre o uso
  int begining; //inicio do tratamento
  int end; //fim do tratamento (pode ser nulo)

  int currentDateTime; //será a data mostrada no card

  Reminder({this.id, 
            this.name, 
            this.dose, 
            this.doseMetric, 
            this.time, 
            this.obs,
            this.begining, 
            this.end,
            this.currentDateTime = 0,});
    
  //recupera do banco para um novo objeto
  factory Reminder.fromMap(Map<String, dynamic> db) => new Reminder(
        id: db["id"],
        name: db["name"],
        dose: db["dose"],
        doseMetric: db["doseMetric"],
        time: db["time"],
        obs: db["obs"],
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
        "obs": obs,
        "begining": begining,
        "end": end,
      };
}