# frozen_string_literal: true

RSpec.describe "Predicates: None" do
  context "with required" do
    subject(:schema) do
      Dry::Schema.define do
        required(:foo) { nil? }
      end
    end

    context "with missing input" do
      let(:input) { {} }

      it "is not successful" do
        expect(result).to be_failing ["is missing", "cannot be defined"]
      end
    end

    context "with nil input" do
      let(:input) { {foo: nil} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with blank input" do
      let(:input) { {foo: ""} }

      it "is not successful" do
        expect(result).to be_failing ["cannot be defined"]
      end
    end

    context "with other input" do
      let(:input) { {foo: 23} }

      it "is not successful" do
        expect(result).to be_failing ["cannot be defined"]
      end
    end
  end

  context "with optional" do
    subject(:schema) do
      Dry::Schema.define do
        optional(:foo) { nil? }
      end
    end

    context "with missing input" do
      let(:input) { {} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with nil input" do
      let(:input) { {foo: nil} }

      it "is successful" do
        expect(result).to be_successful
      end
    end

    context "with blank input" do
      let(:input) { {foo: ""} }

      it "is not successful" do
        expect(result).to be_failing ["cannot be defined"]
      end
    end

    context "with other input" do
      let(:input) { {foo: 23} }

      it "is not successful" do
        expect(result).to be_failing ["cannot be defined"]
      end
    end
  end

  context "as macro" do
    context "with required" do
      context "with value" do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).value(:nil?)
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is not successful" do
            expect(result).to be_failing ["is missing", "cannot be defined"]
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end

        context "with other input" do
          let(:input) { {foo: 23} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end
      end

      context "with filled" do
        subject(:schema) do
          Dry::Schema.define do
            required(:foo).filled(:nil?)
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is not successful" do
            expect(result).to be_failing ["is missing", "cannot be defined"]
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled"]
          end
        end

        context "with other input" do
          let(:input) { {foo: 23} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end
      end

      # makes no sense see: #134
      context "with maybe" do
        it "should raise error" do
          expect {
            Dry::Schema.define do
              required(:foo).maybe(:nil?)
            end
          }          .to raise_error Dry::Schema::InvalidSchemaError
        end
      end
    end

    context "with optional" do
      context "with value" do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).value(:nil?)
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end

        context "with other input" do
          let(:input) { {foo: 23} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end
      end

      context "with filled" do
        subject(:schema) do
          Dry::Schema.define do
            optional(:foo).filled(:nil?)
          end
        end

        context "with missing input" do
          let(:input) { {} }

          it "is successful" do
            expect(result).to be_successful
          end
        end

        context "with nil input" do
          let(:input) { {foo: nil} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled"]
          end
        end

        context "with blank input" do
          let(:input) { {foo: ""} }

          it "is not successful" do
            expect(result).to be_failing ["must be filled"]
          end
        end

        context "with other input" do
          let(:input) { {foo: 23} }

          it "is not successful" do
            expect(result).to be_failing ["cannot be defined"]
          end
        end
      end

      # makes no sense see: #134
      context "with maybe" do
        it "should raise error" do
          expect {
            Dry::Schema.define do
              optional(:foo).maybe(:nil?)
            end
          } .to raise_error Dry::Schema::InvalidSchemaError
        end
      end
    end
  end
end
