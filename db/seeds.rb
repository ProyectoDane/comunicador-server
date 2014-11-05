SeedsFactory.new(User).build_multiple([
  { remote_id: '3bce4931-6c75-41ab-afe0-2ec108a30860', name: 'Juan', last_name: 'Perez', birthdate: DateTime.parse('1990-02-09 10:30:14') }
])

SeedsFactory.new(Card).build_multiple([
  { name: 'Pelota' }
])

SeedsFactory.new(Receiver).build_multiple([
  { remote_id: '724f8001-34f2-4187-d2b2-1aa3f57a772f', name: 'Nicolas', last_name: 'Santángelo', relationship: 'Hermano' }
])

def cid name
  Card.find_by_name(name).id
end

def uid name
  User.find_by_name(name).id
end

def rid name
  Receiver.find_by_name(name).id
end

Exchange.delete_all

Exchange.create({
  card_id: cid('Pelota'),
  user_id: uid('Juan'),
  receiver_id: rid('Nicolas'),
  level: 1,
  date: DateTime.now - 2.months,
  pick: 'withoutHelp',
  reach: 'withPartialHelp',
  drop: 'withHelp'
})
