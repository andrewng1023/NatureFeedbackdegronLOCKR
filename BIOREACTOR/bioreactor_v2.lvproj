<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="13008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="main_machine.vi" Type="VI" URL="../main_machine/main_machine.vi"/>
		<Item Name="main_machine_no_dilution.vi" Type="VI" URL="../main_machine/main_machine_no_dilution.vi"/>
		<Item Name="test_hts_commands.vi" Type="VI" URL="../benchmarking/test_hts_commands.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="BuildHelpPath.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/BuildHelpPath.vi"/>
				<Item Name="Check Special Tags.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Check Special Tags.vi"/>
				<Item Name="Clear Errors.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Clear Errors.vi"/>
				<Item Name="Close File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Close File+.vi"/>
				<Item Name="compatReadText.vi" Type="VI" URL="/&lt;vilib&gt;/_oldvers/_oldvers.llb/compatReadText.vi"/>
				<Item Name="Convert property node font to graphics font.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Convert property node font to graphics font.vi"/>
				<Item Name="Details Display Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Details Display Dialog.vi"/>
				<Item Name="DialogType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogType.ctl"/>
				<Item Name="DialogTypeEnum.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/DialogTypeEnum.ctl"/>
				<Item Name="Dynamic To Waveform Array.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Dynamic To Waveform Array.vi"/>
				<Item Name="Error Code Database.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Error Code Database.vi"/>
				<Item Name="ErrWarn.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/ErrWarn.ctl"/>
				<Item Name="eventvkey.ctl" Type="VI" URL="/&lt;vilib&gt;/event_ctls.llb/eventvkey.ctl"/>
				<Item Name="ex_CorrectErrorChain.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_CorrectErrorChain.vi"/>
				<Item Name="ex_GetAllExpressAttribsPlus.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/ex_GetAllExpressAttribsPlus.vi"/>
				<Item Name="ex_Modify Signal Name.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signal Name.vi"/>
				<Item Name="ex_Modify Signals Names.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/ex_Modify Signals Names.vi"/>
				<Item Name="ex_SetAllExpressAttribs.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/ex_SetAllExpressAttribs.vi"/>
				<Item Name="ex_WaveformAttribs.ctl" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/ex_WaveformAttribs.ctl"/>
				<Item Name="ex_WaveformAttribsPlus.ctl" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/ex_WaveformAttribsPlus.ctl"/>
				<Item Name="Find First Error.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find First Error.vi"/>
				<Item Name="Find Tag.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Find Tag.vi"/>
				<Item Name="Format Message String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Format Message String.vi"/>
				<Item Name="FormatTime String.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/FormatTime String.vi"/>
				<Item Name="General Error Handler CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler CORE.vi"/>
				<Item Name="General Error Handler.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/General Error Handler.vi"/>
				<Item Name="Get String Text Bounds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Get String Text Bounds.vi"/>
				<Item Name="Get Text Rect.vi" Type="VI" URL="/&lt;vilib&gt;/picture/picture.llb/Get Text Rect.vi"/>
				<Item Name="GetHelpDir.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetHelpDir.vi"/>
				<Item Name="GetRTHostConnectedProp.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/GetRTHostConnectedProp.vi"/>
				<Item Name="Longest Line Length in Pixels.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Longest Line Length in Pixels.vi"/>
				<Item Name="LVBoundsTypeDef.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/miscctls.llb/LVBoundsTypeDef.ctl"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="Not Found Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Not Found Dialog.vi"/>
				<Item Name="Open File+.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Open File+.vi"/>
				<Item Name="Read File+ (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read File+ (string).vi"/>
				<Item Name="Read From Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (DBL).vi"/>
				<Item Name="Read From Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (I64).vi"/>
				<Item Name="Read From Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File (string).vi"/>
				<Item Name="Read From Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read From Spreadsheet File.vi"/>
				<Item Name="Read Lines From File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Read Lines From File.vi"/>
				<Item Name="Search and Replace Pattern.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Search and Replace Pattern.vi"/>
				<Item Name="Set Bold Text.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set Bold Text.vi"/>
				<Item Name="Set String Value.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Set String Value.vi"/>
				<Item Name="subElapsedTime.vi" Type="VI" URL="/&lt;vilib&gt;/express/express execution control/ElapsedTimeBlock.llb/subElapsedTime.vi"/>
				<Item Name="subHistogram.vi" Type="VI" URL="/&lt;vilib&gt;/express/express analysis/HistogramBlock.llb/subHistogram.vi"/>
				<Item Name="TagReturnType.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/TagReturnType.ctl"/>
				<Item Name="Three Button Dialog CORE.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog CORE.vi"/>
				<Item Name="Three Button Dialog.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Three Button Dialog.vi"/>
				<Item Name="Trim Whitespace.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/Trim Whitespace.vi"/>
				<Item Name="VISA Configure Serial Port" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port"/>
				<Item Name="VISA Configure Serial Port (Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Instr).vi"/>
				<Item Name="VISA Configure Serial Port (Serial Instr).vi" Type="VI" URL="/&lt;vilib&gt;/Instr/_visa.llb/VISA Configure Serial Port (Serial Instr).vi"/>
				<Item Name="Waveform Array To Dynamic.vi" Type="VI" URL="/&lt;vilib&gt;/express/express shared/transition.llb/Waveform Array To Dynamic.vi"/>
				<Item Name="whitespace.ctl" Type="VI" URL="/&lt;vilib&gt;/Utility/error.llb/whitespace.ctl"/>
				<Item Name="Write Spreadsheet String.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write Spreadsheet String.vi"/>
				<Item Name="Write To Spreadsheet File (DBL).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (DBL).vi"/>
				<Item Name="Write To Spreadsheet File (I64).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (I64).vi"/>
				<Item Name="Write To Spreadsheet File (string).vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File (string).vi"/>
				<Item Name="Write To Spreadsheet File.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/file.llb/Write To Spreadsheet File.vi"/>
			</Item>
			<Item Name="data_message.ctl" Type="VI" URL="../main_machine/type_defs/data_message.ctl"/>
			<Item Name="data_que.vi" Type="VI" URL="../communication/data_que.vi"/>
			<Item Name="experiment_settings.ctl" Type="VI" URL="../main_machine/type_defs/experiment_settings.ctl"/>
			<Item Name="experiment_settings.vi" Type="VI" URL="../communication/experiment_settings.vi"/>
			<Item Name="experiment_states.ctl" Type="VI" URL="../main_machine/type_defs/experiment_states.ctl"/>
			<Item Name="fcs_find_data_start.vi" Type="VI" URL="../fcs_reading/subVIs/fcs_find_data_start.vi"/>
			<Item Name="fcs_new.vi" Type="VI" URL="../fcs_reading/subVIs/fcs_new.vi"/>
			<Item Name="fcs_read.vi" Type="VI" URL="../fcs_reading/subVIs/fcs_read.vi"/>
			<Item Name="find_newest_file.vi" Type="VI" URL="../fcs_reading/subVIs/find_newest_file.vi"/>
			<Item Name="fsc_parameter.ctl" Type="VI" URL="../main_machine/type_defs/fsc_parameter.ctl"/>
			<Item Name="GA_100MS_DELAY.vi" Type="VI" URL="../hts/hts_subvis_ignacio/HTS/GA_100MS_DELAY.vi"/>
			<Item Name="get_curr_valve.vi" Type="VI" URL="../stream_selector/subVIs/get_curr_valve.vi"/>
			<Item Name="global_settings.ctl" Type="VI" URL="../main_machine/type_defs/global_settings.ctl"/>
			<Item Name="global_state_notifier.vi" Type="VI" URL="../communication/global_state_notifier.vi"/>
			<Item Name="graph_data.vi" Type="VI" URL="../fcs_reading/subVIs/graph_data.vi"/>
			<Item Name="hts_command_list.ctl" Type="VI" URL="../hts/type_defs/hts_command_list.ctl"/>
			<Item Name="hts_commands.vi" Type="VI" URL="../hts/sub_vis/hts_commands.vi"/>
			<Item Name="hts_message.ctl" Type="VI" URL="../main_machine/type_defs/hts_message.ctl"/>
			<Item Name="hts_queue.vi" Type="VI" URL="../communication/hts_queue.vi"/>
			<Item Name="HTS_READY.vi" Type="VI" URL="../hts/hts_subvis_ignacio/HTS/HTS_READY.vi"/>
			<Item Name="HTS_WAIT_FOR_READY.vi" Type="VI" URL="../hts/hts_subvis_ignacio/HTS/HTS_WAIT_FOR_READY.vi"/>
			<Item Name="HTS_WRITE_COMMAND.vi" Type="VI" URL="../hts/hts_subvis_ignacio/HTS/HTS_WRITE_COMMAND.vi"/>
			<Item Name="increment_sample_number.vi" Type="VI" URL="../main_machine/subVIs/increment_sample_number.vi"/>
			<Item Name="independent_strober.vi" Type="VI" URL="../led_control/subVIs/independent_strober.vi"/>
			<Item Name="initialize_reactors.vi" Type="VI" URL="../main_machine/subVIs/initialize_reactors.vi"/>
			<Item Name="led_command.vi" Type="VI" URL="../led_control/subVIs/led_command.vi"/>
			<Item Name="led_initallchannels.vi" Type="VI" URL="../led_control/subVIs/led_initallchannels.vi"/>
			<Item Name="led_mm.ctl" Type="VI" URL="../main_machine/type_defs/led_mm.ctl"/>
			<Item Name="leds_queue.vi" Type="VI" URL="../communication/leds_queue.vi"/>
			<Item Name="load_bubble.vi" Type="VI" URL="../hts/sub_vis/load_bubble.vi"/>
			<Item Name="log_ratio.vi" Type="VI" URL="../fcs_reading/subVIs/log_ratio.vi"/>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="machine_thread_mm.ctl" Type="VI" URL="../main_machine/type_defs/machine_thread_mm.ctl"/>
			<Item Name="machine_thread_states.vi" Type="VI" URL="../communication/machine_thread_states.vi"/>
			<Item Name="Mightex_LEDDriver_SDK.dll" Type="Document" URL="../led_control/drivers/lib/Mightex_LEDDriver_SDK.dll"/>
			<Item Name="mm_queue.vi" Type="VI" URL="../communication/mm_queue.vi"/>
			<Item Name="mm_states.ctl" Type="VI" URL="../main_machine/type_defs/mm_states.ctl"/>
			<Item Name="move_and_wait.vi" Type="VI" URL="../stream_selector/subVIs/move_and_wait.vi"/>
			<Item Name="move_to_next.vi" Type="VI" URL="../stream_selector/subVIs/move_to_next.vi"/>
			<Item Name="move_which_direction.vi" Type="VI" URL="../stream_selector/subVIs/move_which_direction.vi"/>
			<Item Name="num2bool.vi" Type="VI" URL="../main_machine/subVIs/num2bool.vi"/>
			<Item Name="prime_lines_drug.vi" Type="VI" URL="../hts/sub_vis/prime_lines_drug.vi"/>
			<Item Name="prime_lines_media.vi" Type="VI" URL="../hts/sub_vis/prime_lines_media.vi"/>
			<Item Name="ps_states.ctl" Type="VI" URL="../main_machine/type_defs/ps_states.ctl"/>
			<Item Name="reactor.ctl" Type="VI" URL="../main_machine/type_defs/reactor.ctl"/>
			<Item Name="reactors.ctl" Type="VI" URL="../main_machine/type_defs/reactors.ctl"/>
			<Item Name="reactors_notifier.vi" Type="VI" URL="../communication/reactors_notifier.vi"/>
			<Item Name="robotics_state.vi" Type="VI" URL="../communication/robotics_state.vi"/>
			<Item Name="robotics_states.ctl" Type="VI" URL="../main_machine/type_defs/robotics_states.ctl"/>
			<Item Name="set_experiment_state.vi" Type="VI" URL="../main_machine/subVIs/set_experiment_state.vi"/>
			<Item Name="set_sample_number.vi" Type="VI" URL="../main_machine/subVIs/set_sample_number.vi"/>
			<Item Name="settings_notifier.vi" Type="VI" URL="../communication/settings_notifier.vi"/>
			<Item Name="start_leds.vi" Type="VI" URL="../led_control/subVIs/start_leds.vi"/>
			<Item Name="strobe_timer.vi" Type="VI" URL="../communication/strobe_timer.vi"/>
			<Item Name="Sub_Initialization.vi" Type="VI" URL="../led_control/documentation/SDK/examples/LabVIEW/Sub_Initialization.vi"/>
			<Item Name="update_exp_state.vi" Type="VI" URL="../main_machine/subVIs/update_exp_state.vi"/>
			<Item Name="update_exp_time.vi" Type="VI" URL="../communication/update_exp_time.vi"/>
			<Item Name="update_reactor_cluster.vi" Type="VI" URL="../main_machine/subVIs/update_reactor_cluster.vi"/>
			<Item Name="valve_command.vi" Type="VI" URL="../stream_selector/subVIs/valve_command.vi"/>
			<Item Name="valve_init.vi" Type="VI" URL="../stream_selector/subVIs/valve_init.vi"/>
			<Item Name="wait_for_hts_pump.vi" Type="VI" URL="../hts/sub_vis/wait_for_hts_pump.vi"/>
			<Item Name="wait_for_pump1.vi" Type="VI" URL="../hts/sub_vis/wait_for_pump1.vi"/>
			<Item Name="wait_for_pump2.vi" Type="VI" URL="../hts/sub_vis/wait_for_pump2.vi"/>
			<Item Name="wait_on_robots.vi" Type="VI" URL="../communication/wait_on_robots.vi"/>
			<Item Name="which_drug_port.vi" Type="VI" URL="../hts/sub_vis/which_drug_port.vi"/>
			<Item Name="write_summary_out.vi" Type="VI" URL="../write_summary_out.vi"/>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>
