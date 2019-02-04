
# Custom `InputEvent` crash

When running the included scene and clicking the button (thus creating
a new `InputEventCustom`), Godot crashes.

## `main.gd`

```
extends Control

# Preload the script so we can use it.
var InputEventCustom = preload("input_event_custom.gd")

func _ready():
    # Add a callback to the `create_event` button.
    $create_event.connect("pressed", self, "on_pressed")
    
func on_pressed():
    # Create the event.
    var event = InputEventCustom.new()
```

## `input_event_custom.gd`

```
extends InputEvent
```

## Backtrace on Godot `master`, hash `919fa75803177d0dc8f03c16b6be1360140145e1`

This is the full output that occurs after pressing `F5` and clicking the button.
```
OpenGL ES 3.0 Renderer: GeForce GTX 1080 Ti/PCIe/SSE2
ERROR: instance: Condition ' !ti->creation_func ' is true. returned: __null
   At: core/class_db.cpp:514.
handle_crash: Program crashed with signal 11
Dumping the backtrace. Please include this when reporting the bug on https://github.com/godotengine/godot/issues
[1] /lib/x86_64-linux-gnu/libc.so.6(+0x41100) [0x7f8099865100] (??:0)
[2] Object::set_script_instance(ScriptInstance*) (/home/zlsa/Software/godot/git/core/object.cpp:1025)
[3] GDScript::_create_instance(Variant const**, int, Object*, bool, Variant::CallError&) (/home/zlsa/Software/godot/git/modules/gdscript/gdscript.cpp:107)
[4] GDScript::_new(Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/modules/gdscript/gdscript.cpp:167)
[5] MethodBindVarArg<GDScript>::call(Object*, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/./core/method_bind.h:343 (discriminator 4))
[6] Object::call(StringName const&, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/core/object.cpp:945 (discriminator 1))
[7] GDScript::call(StringName const&, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/modules/gdscript/gdscript.cpp:661)
[8] Variant::call_ptr(StringName const&, Variant const**, int, Variant*, Variant::CallError&) (/home/zlsa/Software/godot/git/core/variant_call.cpp:1049 (discriminator 1))
[9] GDScriptFunction::call(GDScriptInstance*, Variant const**, int, Variant::CallError&, GDScriptFunction::CallState*) (/home/zlsa/Software/godot/git/modules/gdscript/gdscript_function.cpp:1067)
[10] GDScriptInstance::call(StringName const&, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/modules/gdscript/gdscript.cpp:1174)
[11] Object::call(StringName const&, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/core/object.cpp:924 (discriminator 1))
[12] Object::emit_signal(StringName const&, Variant const**, int) (/home/zlsa/Software/godot/git/core/object.cpp:1231 (discriminator 1))
[13] Object::emit_signal(StringName const&, Variant const&, Variant const&, Variant const&, Variant const&, Variant const&) (/home/zlsa/Software/godot/git/core/object.cpp:1287)
[14] BaseButton::_gui_input(Ref<InputEvent>) (/home/zlsa/Software/godot/git/scene/gui/base_button.cpp:139 (discriminator 2))
[15] MethodBind1<Ref<InputEvent> >::call(Object*, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/./core/method_bind.gen.inc:729 (discriminator 12))
[16] Object::call_multilevel(StringName const&, Variant const**, int) (/home/zlsa/Software/godot/git/core/object.cpp:779 (discriminator 1))
[17] Object::call_multilevel(StringName const&, Variant const&, Variant const&, Variant const&, Variant const&, Variant const&) (/home/zlsa/Software/godot/git/core/object.cpp:886)
[18] Viewport::_gui_call_input(Control*, Ref<InputEvent> const&) (/home/zlsa/Software/godot/git/scene/main/viewport.cpp:1542 (discriminator 2))
[19] Viewport::_gui_input_event(Ref<InputEvent>) (/home/zlsa/Software/godot/git/scene/main/viewport.cpp:1912 (discriminator 3))
[20] Viewport::input(Ref<InputEvent> const&) (/home/zlsa/Software/godot/git/scene/main/viewport.cpp:2663 (discriminator 2))
[21] Viewport::_vp_input(Ref<InputEvent> const&) (/home/zlsa/Software/godot/git/scene/main/viewport.cpp:1319)
[22] MethodBind1<Ref<InputEvent> const&>::call(Object*, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/./core/method_bind.gen.inc:729 (discriminator 12))
[23] Object::call(StringName const&, Variant const**, int, Variant::CallError&) (/home/zlsa/Software/godot/git/core/object.cpp:945 (discriminator 1))
[24] Object::call(StringName const&, Variant const&, Variant const&, Variant const&, Variant const&, Variant const&) (/home/zlsa/Software/godot/git/core/object.cpp:870)
[25] SceneTree::call_group_flags(unsigned int, StringName const&, StringName const&, Variant const&, Variant const&, Variant const&, Variant const&, Variant const&) (/home/zlsa/Software/godot/git/scene/main/scene_tree.cpp:262)
[26] SceneTree::input_event(Ref<InputEvent> const&) (/home/zlsa/Software/godot/git/scene/main/scene_tree.cpp:418 (discriminator 6))
[27] InputDefault::_parse_input_event_impl(Ref<InputEvent> const&, bool) (/home/zlsa/Software/godot/git/main/input_default.cpp:414)
[28] InputDefault::parse_input_event(Ref<InputEvent> const&) (/home/zlsa/Software/godot/git/main/input_default.cpp:260)
[29] OS_X11::process_xevents() (/home/zlsa/Software/godot/git/platform/x11/os_x11.cpp:2137 (discriminator 3))
[30] OS_X11::run() (/home/zlsa/Software/godot/git/platform/x11/os_x11.cpp:2973)
[31] /home/zlsa/Software/godot/git/bin/godot.x11.tools.64(main+0xdc) [0x115b45e] (/home/zlsa/Software/godot/git/platform/x11/godot_x11.cpp:56)
[32] /lib/x86_64-linux-gnu/libc.so.6(__libc_start_main+0xeb) [0x7f809984809b] (??:0)
[33] /home/zlsa/Software/godot/git/bin/godot.x11.tools.64(_start+0x2a) [0x115b2ca] (??:?)
-- END OF BACKTRACE --
```
