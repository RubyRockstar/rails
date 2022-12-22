module Rules
  class AllTestsPassages < AbstractRuleSpecification
    def match?
      return false unless @test_passage.successful

      test_passages_ids = TestPassage.successful.where(user_id: @user.id).pluck(:test_id).uniq
      tests_ids = Test.all.pluck(:id).sort
      test_passages_ids == tests_ids
    end
  end
end
