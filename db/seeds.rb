# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
query_string = <<query 
    create
    ( Union { name: 'Ұлы жүз', menu: true }),
	(Union { name: 'Орта жүз', menu: true }), 
	(Union { name: 'Кіші жүз', menu: true }),
	(Union { name: 'Төре'}),
	(Union { name: 'Қожа'}),
	(Union { name: 'Төлеңгіт'})
query

Neo4j::Session.current.query(query_string)

=begin 
query_string = <<query
  create
  (_6:DrugClass  {id: 1, name:"Bronchodilators"}),
  (_7:DrugClass  {id: 2, name:"Corticosteroids"}),
  (_8:DrugClass  {id: 3, name:"Xanthine"}),
  (_9:Drug   {id: 1, name:"Salbutamol"}),
  (_10:Drug  {id: 2, name:"Terbutaline"}),
  (_11:Drug  {id: 3, name:"Bambuterol"}),
  (_12:Drug  {id: 4, name:"Formoterol"}),
  (_13:Drug  {id: 5, name:"Salmeterol"}),
  (_14:Drug  {id: 6, name:"Beclometasone"}),
  (_15:Drug  {id: 7, name:"Budesonide"}),
  (_16:Drug  {id: 8, name:"Ciclesonide"}),
  (_17:Drug  {id: 9, name:"Fluticasone"}),
  (_18:Drug  {id: 10, name:"Mometasone"}),
  (_19:Drug  {id: 11, name:"Betametasone"}),
  (_20:Drug  {id: 12, name:"Prednisolone"}),
  (_21:Drug  {id: 13, name:"Dilatrane"}),
  (_22:Allergy  {id: 1, name:"Hypersensitivity to Betametasone"}),
  (_23:Pathology  {id: 1, name:"Asthma"}),
  (_24:Symptom  {id: 1, name:"Wheezing"}),
  (_25:Symptom  {id: 2, name:"Chest tightness"}),
  (_26:Symptom  {id: 3, name:"Cough"}),
  (_27:Doctor  {id: 1, latitude:48.8573,longitude:2.35685,name:"Irving Matrix"}),
  (_28:Doctor  {id: 2, latitude:46.83144,longitude:-71.28454,name:"Jack McKee"}),
  (_29:Doctor  {id: 3, latitude:48.86982,longitude:2.32503,name:"Michaela Quinn"}),
  (_30:DoctorSpecialization  {id: 1, name:"Physician"}),
  (_31:DoctorSpecialization  {id: 2, name:"Angiologist"}),
  _6-[:cures {age_max:60,age_min:18,indication:"Adult asthma"}]->_23,
  _7-[:cures {age_max:18,age_min:5,indication:"Child asthma"}]->_23,
  _8-[:cures {age_max:60,age_min:18,indication:"Adult asthma"}]->_23,
  _9-[:belongs_to_class]->_6,
  _10-[:belongs_to_class]->_6,
  _11-[:belongs_to_class]->_6,
  _12-[:belongs_to_class]->_6,
  _13-[:belongs_to_class]->_6,
  _14-[:belongs_to_class]->_7,
  _15-[:belongs_to_class]->_7,
  _16-[:belongs_to_class]->_7,
  _17-[:belongs_to_class]->_7,
  _18-[:belongs_to_class]->_7,
  _19-[:belongs_to_class]->_6,
  _19-[:belongs_to_class]->_7,
  _19-[:may_cause_allergy]->_22,
  _20-[:belongs_to_class]->_7,
  _21-[:belongs_to_class]->_8,
  _23-[:may_manifest_symptoms]->_24,
  _23-[:may_manifest_symptoms]->_25,
  _23-[:may_manifest_symptoms]->_26,
  _27-[:specializes_in]->_31,
  _28-[:specializes_in]->_31,
  _29-[:specializes_in]->_30,
  _30-[:can_prescribe]->_7,
  _31-[:can_prescribe]->_6
query

Neo4j::Session.current.query(query_string)

=end