From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] [Testers wanted] New glibc with profiling fixed.
Date: Mon, 12 Jan 2004 22:42:15 -0700
Message-ID: <20040113054215.GB27285__45425.7413781763$1416623125$gmane$org@colo.lackof.org>
References: <20040105194809.GA9269@systemhalted>
	<20040105194839.GB9269@systemhalted>
	<20040111040906.GA32382@colo.lackof.org>
	<20040111204355.GL28742@systemhalted>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org, debian-hppa@lists.debian.org
To: Carlos O'Donell <carlos@baldric.uwo.ca>
Return-Path: <grundler@lackof.org>
In-Reply-To: <20040111204355.GL28742@systemhalted>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>

On Sun, Jan 11, 2004 at 03:43:55PM -0500, Carlos O'Donell wrote:
> Excellent. You haven't tried profiling any programs have you? :)
> Compile with CFLAGS=-pg, run-em, then run gprof on the gmon.out output?

Here's "apps/openssl speed rsa" gprof output from my c3000.
(2.6.0-pa7, Debian testing)

TBH, it looks wrong.
I didn't expect "get_dsa1024" to show up.
I suspect I didn't get all the various CFLAGS.
I edited */Makefile and added -pg by hand to "CFLAG" variables
and then "make clean" + "make".

hth,
grant


Flat profile:

Each sample counts as 0.01 seconds.
  %   cumulative   self              self     total           
 time   seconds   seconds    calls  Ts/call  Ts/call  name    
 63.64      0.07     0.07                             lock_dbg_cb
 27.27      0.10     0.03                             check_end
  9.09      0.11     0.01                             call_frame_dummy
  0.00      0.11     0.00       16     0.00     0.00  Time_F
  0.00      0.11     0.00        8     0.00     0.00  pkey_print_message
  0.00      0.11     0.00        1     0.00     0.00  destroy_ui_method
  0.00      0.11     0.00        1     0.00     0.00  do_cmd
  0.00      0.11     0.00        1     0.00     0.00  get_dsa1024
  0.00      0.11     0.00        1     0.00     0.00  get_dsa2048
  0.00      0.11     0.00        1     0.00     0.00  get_dsa512
  0.00      0.11     0.00        1     0.00     0.00  load_config
  0.00      0.11     0.00        1     0.00     0.00  make_config_name
  0.00      0.11     0.00        1     0.00     0.00  prog_init
  0.00      0.11     0.00        1     0.00     0.00  program_name
  0.00      0.11     0.00        1     0.00     0.00  setup_ui_method
  0.00      0.11     0.00        1     0.00     0.00  speed_main

 %         the percentage of the total running time of the
time       program used by this function.

cumulative a running sum of the number of seconds accounted
 seconds   for by this function and those listed above it.

 self      the number of seconds accounted for by this
seconds    function alone.  This is the major sort for this
           listing.

calls      the number of times this function was invoked, if
           this function is profiled, else blank.
 
 self      the average number of milliseconds spent in this
ms/call    function per call, if this function is profiled,
	   else blank.

 total     the average number of milliseconds spent in this
ms/call    function and its descendents per call, if this 
	   function is profiled, else blank.

name       the name of the function.  This is the minor sort
           for this listing. The index shows the location of
	   the function in the gprof listing. If the index is
	   in parenthesis it shows where it would appear in
	   the gprof listing if it were to be printed.

		     Call graph (explanation follows)


granularity: each sample hit covers 2 byte(s) for 9.09% of 0.11 seconds

index % time    self  children    called     name
                                                 <spontaneous>
[1]     63.6    0.07    0.00                 lock_dbg_cb [1]
-----------------------------------------------
                                                 <spontaneous>
[2]     27.3    0.03    0.00                 check_end [2]
-----------------------------------------------
                                                 <spontaneous>
[3]      9.1    0.01    0.00                 call_frame_dummy [3]
-----------------------------------------------
                0.00    0.00      16/16          speed_main [16]
[4]      0.0    0.00    0.00      16         Time_F [4]
-----------------------------------------------
                0.00    0.00       8/8           speed_main [16]
[5]      0.0    0.00    0.00       8         pkey_print_message [5]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[6]      0.0    0.00    0.00       1         destroy_ui_method [6]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[7]      0.0    0.00    0.00       1         do_cmd [7]
                0.00    0.00       1/1           speed_main [16]
-----------------------------------------------
                0.00    0.00       1/1           speed_main [16]
[8]      0.0    0.00    0.00       1         get_dsa1024 [8]
-----------------------------------------------
                0.00    0.00       1/1           speed_main [16]
[9]      0.0    0.00    0.00       1         get_dsa2048 [9]
-----------------------------------------------
                0.00    0.00       1/1           speed_main [16]
[10]     0.0    0.00    0.00       1         get_dsa512 [10]
-----------------------------------------------
                0.00    0.00       1/1           speed_main [16]
[11]     0.0    0.00    0.00       1         load_config [11]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[12]     0.0    0.00    0.00       1         make_config_name [12]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[13]     0.0    0.00    0.00       1         prog_init [13]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[14]     0.0    0.00    0.00       1         program_name [14]
-----------------------------------------------
                0.00    0.00       1/1           main [131]
[15]     0.0    0.00    0.00       1         setup_ui_method [15]
-----------------------------------------------
                0.00    0.00       1/1           do_cmd [7]
[16]     0.0    0.00    0.00       1         speed_main [16]
                0.00    0.00      16/16          Time_F [4]
                0.00    0.00       8/8           pkey_print_message [5]
                0.00    0.00       1/1           load_config [11]
                0.00    0.00       1/1           get_dsa512 [10]
                0.00    0.00       1/1           get_dsa1024 [8]
                0.00    0.00       1/1           get_dsa2048 [9]
-----------------------------------------------

 This table describes the call tree of the program, and was sorted by
 the total amount of time spent in each function and its children.

 Each entry in this table consists of several lines.  The line with the
 index number at the left hand margin lists the current function.
 The lines above it list the functions that called this function,
 and the lines below it list the functions this one called.
 This line lists:
     index	A unique number given to each element of the table.
		Index numbers are sorted numerically.
		The index number is printed next to every function name so
		it is easier to look up where the function in the table.

     % time	This is the percentage of the `total' time that was spent
		in this function and its children.  Note that due to
		different viewpoints, functions excluded by options, etc,
		these numbers will NOT add up to 100%.

     self	This is the total amount of time spent in this function.

     children	This is the total amount of time propagated into this
		function by its children.

     called	This is the number of times the function was called.
		If the function called itself recursively, the number
		only includes non-recursive calls, and is followed by
		a `+' and the number of recursive calls.

     name	The name of the current function.  The index number is
		printed after it.  If the function is a member of a
		cycle, the cycle number is printed between the
		function's name and the index number.


 For the function's parents, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the function into this parent.

     children	This is the amount of time that was propagated from
		the function's children into this parent.

     called	This is the number of times this parent called the
		function `/' the total number of times the function
		was called.  Recursive calls to the function are not
		included in the number after the `/'.

     name	This is the name of the parent.  The parent's index
		number is printed after it.  If the parent is a
		member of a cycle, the cycle number is printed between
		the name and the index number.

 If the parents of the function cannot be determined, the word
 `<spontaneous>' is printed in the `name' field, and all the other
 fields are blank.

 For the function's children, the fields have the following meanings:

     self	This is the amount of time that was propagated directly
		from the child into the function.

     children	This is the amount of time that was propagated from the
		child's children to the function.

     called	This is the number of times the function called
		this child `/' the total number of times the child
		was called.  Recursive calls by the child are not
		listed in the number after the `/'.

     name	This is the name of the child.  The child's index
		number is printed after it.  If the child is a
		member of a cycle, the cycle number is printed
		between the name and the index number.

 If there are any cycles (circles) in the call graph, there is an
 entry for the cycle-as-a-whole.  This entry shows who called the
 cycle (as parents) and the members of the cycle (as children.)
 The `+' recursive calls entry shows the number of function calls that
 were internal to the cycle, and the calls entry for each member shows,
 for that member, how many times it was called from other members of
 the cycle.


Index by function name

   [4] Time_F                  [9] get_dsa2048            [13] prog_init
   [3] call_frame_dummy       [10] get_dsa512             [14] program_name
   [2] check_end              [11] load_config            [15] setup_ui_method
   [6] destroy_ui_method       [1] lock_dbg_cb            [16] speed_main
   [7] do_cmd                 [12] make_config_name
   [8] get_dsa1024             [5] pkey_print_message
