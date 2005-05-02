From: Joel Soete <soete.joel@tiscali.be>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Mon, 02 May 2005 18:37:07 +0000
Message-ID: <42767353.4040100@tiscali.be>
References: <200503261548.j2QFm7eL005849@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii;
  format=flowed
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200503261548.j2QFm7eL005849@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

Hello Dave,

John David Anglin wrote:
[snip]
>>Besides the recent gcc-snapshot build failure, I'm having problems
>>building the packages at all at the moment, there's no difference
>>using between sarge and unstable.
> 
I am trying now the new debian dpkg sources gcc-4.0

> 
> I've had this problem from time to time, particularly on server
> machines.  My c3k is solid and this doesn't happen.  For some reason,
> the libjava build is most prone to the segfaults in sh/bash and
> sometimes make.  Grant's recent builds on gsyprf11 seem to have
> changed the nature of the faults.  Now, the kernel panics instead
> of a segfault in sh.  Grant would know more as to what's causing
> these crashes.
>
I am using a sister system a b2k with a 2.6.12-rc2-pa1 64bit (more stable then the 32bit)
and an unstable debian install.

> 
>>- if the build succeeds, every test case in the testsuite fails, due
>>  to expect(?) problems. lamont told me that's reproducible on another
>>  A500, seeing some messages on the serial console, but I can't see
>>  these messages. I'm currently running the A500 kernels from the
>>  parisc archives. palinux-a500-defconfig-2.6.{8.1-pa11,11-pa2,12-rc1-pa1}
>>  all show the same behaviour.
>
but I unfortunately encounter also an expect pb (hanging):
# ps -ef
[snip]
root     11231 11228  9 17:08 pts/1    00:13:36 expect -- /usr/share/dejagnu/runtest.exp --tool gcc
root     11251 11231  0 17:08 pts/1    00:00:01 [expect] <defunct>
root     13466  1414  0 18:53 ?        00:00:00 sshd: jso [priv]
root     13478 13466  0 18:53 ?        00:00:00 sshd: jso [priv]
jso      13584 13466  0 18:53 ?        00:00:00 sshd: jso@pts/5
jso      13587 13584  0 18:53 pts/5    00:00:00 -bash
root     13695 13587  0 18:53 pts/5    00:00:00 -su
root     14056 11231  0 18:54 pts/1    00:00:00 [20020220-1.exe] <defunct>
root     14057 11231  0 18:54 pts/1    00:00:00 [cat] <defunct>
root     14226 10073  0 19:34 pts/1    00:00:00 sleep 30
root     14227 13695  0 19:34 pts/5    00:00:00 ps -ef

# pstree 11228
expect --- [20020220-1.exe]
          + [cat]
          + [expect]

and the console showing me:
       -------------------------------
              \   ^__^
               \  (xx)\_______
                  (__)\       )\/\
                   U  ||----w |
                      ||     ||
expect (pid 11251): Protection id trap (code 27)

      YZrvWESTHLNXBCVMcbcbcbcbOGFRQPDI
PSW: 00001000000001101111111100001111 Not tainted
r00-03  0000000000000000 000000001046a030 00000000101b21ec 000000001fdafb00
r04-07  00000000105c4ce0 0000000000000000 000000000002e4f8 0000000000000001
r08-11  0000000000000000 000000000002e500 00000000000001fe 000000001fdafb00
r12-15  fffffffffffffff2 0000000000000000 00000000000aa000 00000000000f2f08
r16-19  0000000000000000 00000000000f2a88 0000000000000001 000000001f3ec000
r20-23  0000000000000001 0000000000000000 000000000002e4fe 000000001fdafb1a
r24-27  0000000000000000 0000000000000001 000000001b3dac80 00000000105c4ce0
r28-31  0000000000000000 000000001f3ec3c0 000000001f3ec270 0000000000000000
sr0-3   0000000000bc8800 0000000000000000 0000000000000000 0000000000bc8800
sr4-7   0000000000000000 0000000000000000 0000000000000000 0000000000000000

IASQ: 0000000000000000 0000000000000000 IAOQ: 00000000101b22e4 00000000101b22e8
  IIR: 0ed5d240    ISR: 0000000000bc8800  IOR: 000000000002e4fe
  CPU:        0   CR30: 000000001f3ec000 CR31: 0000000010584000
  ORIG_R28: 000000001010e400
  IAOQ[0]: sys_poll+0x274/0x298
  IAOQ[1]: sys_poll+0x278/0x298
  RP(r2): sys_poll+0x17c/0x298

  # disasm 0ed5d240
    0:   0e d5 d2 40     sth r21,0(sr3,r22)

as r22 ended by E, the privilege of this address would be 2 (the last 2 bits?)

> 
> I think that there are issues with expect, tcl and dejagnu.
> 
> 1) Dejagnu asks expect to trap SEGFAULTS.  This is undefined and results
>    in the fault insn being executed repeatively.  It's a simple one line
>    fix to remove this:
> 
> --- runtest.exp.orig    2004-08-25 16:10:38.000000000 -0400
> +++ runtest.exp 2004-08-25 16:11:13.000000000 -0400
> @@ -1503,8 +1503,7 @@
>  if ![exp_debug] {
>       foreach sig "{SIGTERM {terminated}} \
> 		    {SIGINT  {interrupted by user}} \
> -             {SIGQUIT {interrupted by user}} \
> -             {SIGSEGV {segmentation violation}}" {
> +             {SIGQUIT {interrupted by user}}" {
> 	 set signal [lindex $sig 0]
> 	 set str [lindex $sig 1]
> 	 trap "send_error \"got a \[trap -name\] signal, $str \\n\"; log_and_exit;" $signal
> 
>    I've probably munged the diff doing a cut and paste.
> 
Even thought I applied this patch

> 2) There is some kind of timing issue with expect/tcl when a given
>    test ends.  This causes expect to hang.  When this happens, you
>    will see a defunct expect task.  It is a child of the expect task
>    that is hung.
> 
Exactely the one which try to access an address without having enough privilege (if i well understand?)

>    Tcl 8.3 works better than 8.4.  I know they have changed some of
>    the code in this area but I don't know why this happens.  I've also
>    had this happen on x86 but pa seems much more prone to this problem.
> 
>    Tcl 8.3 also works better for tests that generate a lot of output.
>    It is less likely to truncate the output resulting in a test failure.
>    I think this has to do with the handling of pipes at exit.
> 
Well I just rediscover this kind comments, so still have to test this and the rest

> 3) A warning appears compiling expect in a couple of places regarding
>    the second argument of waitpid.  It's always int.  However, expect
>    thinks the type of this argument is WAIT_STATUS_TYPE.  This gets
>    used when NO_UNION_WAIT isn't defined.  This problem can be worked
>    around be adding "-ansi -D_SVID_SOURCE -D_POSIX_SOURCE" to CFLAGS.
>    I had hoped that fixing this would resolve the expect hangs but it
>    doesn't seem to help.  However, I do like a build without warnings.
>    To get this with the above CFLAGS, a number of missing include
>    directives need to be added.
> 
>    I use the following setup:
> 
>    dave@hiauly6:~/gnu/expect-5.43/objdir$ runtest --version
>    WARNING: Couldn't find the global config file.
>    Expect version is       5.43.0
>    Tcl version is          8.3
>    Framework version is    1.4.4
> 
>    I haven't seen any significant difference in behavior between
>    5.42.1 and 5.43.0.  The former is the debian patched source.
> 
> 4) There is a exit timing issue in tcl 8.4.  I tried a patch from the
>    tcl list that claimed to fix this but it didn't seem to fix either
>    the hangs or the truncation problem.
> 
> 
Thanks a lot,
	Joel

_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
