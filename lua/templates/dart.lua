local utils = require("new-file-template.utils")

--- this method return a name from the filename and convert it into a classname
--- @param filename string
---
local function get_class_name(filename)
  return utils.snake_to_class_camel(vim.split(filename, "%.")[1])
end

--->>>>>>>>>>>>>> This section below is for cubit file template<<<<<<<<<<<------

--- this method return a template for cubit file
--- @param filename string
---
local function cubit_file_template(_, filename) -- just an example
  return [[
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part ']] .. vim.split(filename, "_cubit.dart")[1] .. [[_state.dart';

class ]] .. get_class_name(filename) .. [[ extends Cubit<]] .. vim.split(get_class_name(filename), "Cubit")[1] .. [[State> {
  ]] .. get_class_name(filename) .. [[() : super(]] .. vim.split(get_class_name(filename), "Cubit")[1] .. [[Initial());
  |cursor|
}
  ]]
end

--- this method return a template for cubit state file
--- @param filename string
local function cubit_state_file_template(_, filename) -- just an example
  return [[
part of ']] .. vim.split(filename, "_state.dart")[1] .. [[_cubit.dart';

@immutable
sealed class ]] .. get_class_name(filename) .. [[ {}

final class ]] .. vim.split(get_class_name(filename), "State")[1] .. [[Initial extends ]] .. get_class_name(filename) .. [[{
  |cursor|}
  ]]
end

--->>>>>>>>>>>End of cubit file template section<<<<<<<<<<---

--->>>>>>>>>>>>>> This section below is for bloc file template<<<<<<<<<<<------
local function bloc_file_template(_, filename)
  return [[
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part ']] .. vim.split(filename, "_bloc.dart")[1] .. [[_event.dart';
part ']] .. vim.split(filename, "_bloc.dart")[1] .. [[_state.dart';

class ]] .. get_class_name(filename) .. [[extends Bloc<]] .. vim.split(get_class_name(filename), "Bloc")[1] .. [[Event, ]] .. vim.split(
    get_class_name(filename),
    "Bloc"
  )[1] .. [[State> {
  ]] .. get_class_name(filename) .. [[]() : super(]] .. vim.split(get_class_name(filename), "Bloc")[1] .. [[Initial()) {
    on<]] .. vim.split(get_class_name(filename), "Bloc")[1] .. [[Event>((event, emit) {
      // TODO: implement event handler
      |cursor|
    });
  }
}]]
end

local function bloc_event_file_template(_, filename)
  return [[
  part of ']] .. vim.split(filename, "_event.dart")[1] .. [[_bloc.dart';

sealed class ]] .. get_class_name(filename) .. [[ extends Equatable {
  const ]] .. get_class_name(filename) .. [[();

  @override
  List<Object> get props => [];
}]]
end

local function bloc_state_file_template(_, filename)
  return [[
part of ']] .. vim.split(filename, "_state.dart")[1] .. [[_bloc.dart';

sealed class ]] .. get_class_name(filename) .. [[ extends Equatable {
  const ]] .. get_class_name(filename) .. [[();
  
  @override
  List<Object> get props => [];
}


]]
end
--->>>>>>>>>>>End of cubit file template section<<<<<<<<<<---

--- @param opts table
---   A table containing the following fields:
---   - `full_path` (string): The full path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `relative_path` (string): The relative path of the new file, e.g., "lua/new-file-template/templates/init.lua".
---   - `filename` (string): The filename of the new file, e.g., "init.lua".
return function(opts)
  local template = {
    { pattern = "cubit/.*_cubit.*", content = cubit_file_template },
    { pattern = "cubit/.*_state.*", content = cubit_state_file_template },
    { pattern = "bloc/.*_bloc.*", content = bloc_file_template },
    { pattern = "bloc/.*_event.*", content = bloc_event_file_template },
    { pattern = "bloc/.*_state.*", content = bloc_state_file_template },
  }

  return utils.find_entry(template, opts)
end
