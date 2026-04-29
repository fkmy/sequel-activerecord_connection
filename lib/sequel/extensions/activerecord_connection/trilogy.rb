require_relative "utils"

module Sequel
  module ActiveRecordConnection
    module Trilogy
      def synchronize(*)
        super do |conn|
          # required for prepared statements
          Utils.add_prepared_statements_cache(conn)

          yield conn
        end
      end

      private

      def activerecord_connection_class
        ::Trilogy
      end
    end
  end
end
