class ShmcheckoutSerializer < ActiveModel::Serializer
  attributes :id, :nonce, :amount, :merchantID, :deviceData
end
