Helper = require('hubot-test-helper')
expect = require('chai').expect

helper = new Helper('./../scripts/birthday.coffee')

describe 'birthday', ->

  beforeEach ->
    @room = helper.createRoom()

  afterEach ->
    @room.destroy()

  context 'user says "When is your birthday?"', ->
    beforeEach ->
      @room.user.say 'alice', 'hubot When is your birthday?'
      @room.user.say 'bob',   'hubot When is your birthday?'

    it 'should tell her birthday to user', ->
      expect(@room.messages).to.eql [
        ['alice', 'hubot When is your birthday?']
        ['hubot', 'I was born on May 11th, 2015.']
        ['bob',   'hubot When is your birthday?']
        ['hubot', 'I was born on May 11th, 2015.']
      ]
