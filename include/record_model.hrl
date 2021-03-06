-record(access_mode,{
		  r = true :: boolean(),
		  sr = true :: boolean(),
		  w = true :: boolean(),
		  sw = true :: boolean()
		 }).

-record(record_field,{
		  name :: binary(), % Field name which will be used to access property

		  is_required = false :: boolean(),

		  mode = #access_mode{} :: #access_mode{}, % From 'r | w | rw | sr | sw | srsw | rsw | srw'
		  getter = true :: true | false, % create getter
		  setter = true :: true | false, % create setter

		  stores_in_record = true :: boolean(), % Set to true if field value stores in state record
		  type = any :: field_type(), % Record type. Usefull for dializer
		  to_ext :: atom() | {atom(), atom()},
		  from_ext :: atom() | {atom(), atom()},
		  default_value :: any(),

		  validators = [] :: atom() | {atom(), atom()} | {atom(), list()} | {atom(), atom(), list()}
		 }).

-record(record_model, {
		  module :: atom(),
		  fields = [] :: [#record_field{}],
		  validators = [] :: atom() | {atom(), atom()} | {atom(), list()} | {atom(), atom(), list()}
		 }).

-type field_type() :: {atom(),atom()} | integer | non_neg_integer | binary.
