SeedsFactory.new(User).build_multiple([
  { remote_id: '3bce4931-6c75-41ab-afe0-2ec108a30860', name: 'Jorge', last_name: 'Perez', birthdate: DateTime.parse('1990-02-09 10:30:14') },
  { remote_id: '85e90a37-183d-4757-fd29-50a3197ecca0', name: 'Miguel', last_name: 'Soto', birthdate: DateTime.parse('2000-03-01 02:17:24') },
  { remote_id: '1974a0f4-adad-4a63-a819-b13543980169', name: 'Carlos', last_name: 'Ling', birthdate: DateTime.parse('2005-08-19 11:22:34') },
])

SeedsFactory.new(Card).build_multiple([
  { name: 'Pelota' },
  { name: 'Perro' },
  { name: 'Chocolate' },
  { name: 'Caramelo' },
  { name: 'Libro' }
])

SeedsFactory.new(Receiver).build_multiple([
  { remote_id: '724f8001-34f2-4187-d2b2-1aa3f57a772f', name: 'Damian', last_name: 'Martinez', relationship: 'Padre' },
  { remote_id: '4951cc2f-0a86-4020-da2a-51883dbb722f', name: 'Magali', last_name: 'Mendoza',  relationship: 'Madre' },
  { remote_id: 'e7a84e85-baaf-42b4-9552-dd5e8cda9733', name: 'Mariano', last_name: 'Dome',    relationship: 'Terapeuta' },
  { remote_id: '329a4c22-4d4b-4f3d-c5d0-fc65de153811', name: 'Daniela', last_name: 'Amoros',  relationship: 'Hermano' },
  { remote_id: '1199ca19-254c-4d9f-df6a-69819b197f2f', name: 'Aldana', last_name: 'Branchi',  relationship: 'Terapeuta' },
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

Exchange.create({ card_id: cid('Pelota'), user_id: uid('Jorge'), receiver_id: rid('Damian'), level: 1, date: DateTime.now - 2.months,
  pick: 'withoutHelp', reach: 'withPartialHelp', drop: 'withHelp' })

Exchange.create({ card_id: cid('Perro'), user_id: uid('Jorge'), receiver_id: rid('Damian'), level: 1, date: DateTime.now - 2.months,
    pick: 'withHelp', reach: 'withPartialHelp', drop: 'withHelp' })
  
Exchange.create({ card_id: cid('Libro'), user_id: uid('Jorge'), receiver_id: rid('Magali'), level: 1, date: DateTime.now - 1.months,
    pick: 'withoutHelp', reach: 'withoutHelp', drop: 'withPartialHelp' })

Exchange.create({ card_id: cid('Pelota'), user_id: uid('Miguel'), receiver_id: rid('Aldana'), level: 1, date: DateTime.now,
    pick: 'withPartialHelp', reach: 'withPartialHelp', drop: 'withPartialHelp' })

Exchange.create({ card_id: cid('Chocolate'), user_id: uid('Miguel'), receiver_id: rid('Aldana'), level: 1, date: DateTime.now,
    pick: 'withoutHelp', reach: 'withPartialHelp', drop: 'withHelp' })

Exchange.create({ card_id: cid('Caramelo'), user_id: uid('Carlos'), receiver_id: rid('Mariano'), level: 1, date: DateTime.now,
    pick: 'withoutHelp', reach: 'withoutHelp', drop: 'withPartialHelp' })
