Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from rhirst.linuxcare.com (pc117-bre9.cable.ntl.com [213.105.88.117])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5F8FF4A19
	for <parisc-linux@lists.parisc-linux.org>; Fri, 23 Feb 2001 14:22:48 -0700 (MST)
Received: by rhirst.linuxcare.com (Postfix, from userid 501)
	id 59F00B005; Fri, 23 Feb 2001 21:23:25 +0000 (GMT)
Date: Fri, 23 Feb 2001 21:23:25 +0000
From: Richard Hirst <rhirst@linuxcare.com>
To: Alan Modra <alan@linuxcare.com.au>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] Re: pipes
Message-ID: <20010223212325.K4660@linuxcare.com>
References: <20010223113052.G4660@linuxcare.com> <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <Pine.LNX.4.21.0102232231470.9345-100000@front.linuxcare.com.au>; from alan@linuxcare.com.au on Fri, Feb 23, 2001 at 10:32:55PM +1100
List-ID: <linux-parisc.vger.kernel.org>

On Fri, Feb 23, 2001 at 10:32:55PM +1100, Alan Modra wrote:
> On Fri, 23 Feb 2001, Richard Hirst wrote:
> 
> > Probably.  Without strace, I now get
> > 
> > merlin:/build# ./fix-bug.sh 
> > /bin/sh: d: command not found                               
> > 
> > 
> > and it hangs with both ends reading their respective pipes.  I guess
> > that indicates I am hitting the same problem as you, anyway.
> 
> This is exactly what I get, right down to the same "d: command not found"

I've added debug to the kernel fs/pipe.c, which shows the problem is
most likely data loss in the child read from the pipe.
The child always issues reads with a 159 byte buffer.  The last write
from the parent is 161 bytes, as can be seen in this strace log:

189   06:24:51 write(5, "cd /usr/include\nfile=sys/stat.h\nif ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n", 161) = 161   
190   06:24:51 <... read resumed> "cd /usr/include\nfile=sys/stat.h\nif ( test -r types/vxTypesOld.h ) > /dev/null 2>&1\nthen echo TRUE\nelse echo FALSE\nfi\n\necho\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtE", 159) = 159

(that strace is not from the same run as the debug o/p below, I get
crashes when 190 forks off a child to run the test under strace, so
had to run without strace for the debug below)

and from my debug in the kernel, I see:
(header is pid,inode,r/w,byte-cnt)

189:2504b2a0,write2,259: "cd /usr/include\ncase hppa-unknown-linux-...ho\necho ShElL-OuTpUt-HaS-bEeN-cO
mPlEtEd\n"
190:2504b2a0,read2,159: "cd /usr/include\ncase hppa-unknown-linux-... \\\npowerpcle-*-solaris2.[0-4] | 
\\\nsparc-"
190:2504b2a0,read2,100: "*-solaris2.[0-4] )\n    echo run ;;\n* ) e...ho\necho ShElL-OuTpUt-HaS-bEeN-cO
mPlEtEd\n"
190:2504b0c0,write2,5: "skip\n"
189:2504b0c0,read2,5: "skip\n"
190:2504b0c0,write2,1: "\n"
189:2504b0c0,read2,1: "\n"
190:2504b0c0,write2,32: "ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n"
189:2504b0c0,read2,32: "ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd\n"
189:2504b660,read2,13: "./sys/stat.h\n"
189:2504b2a0,write2,161: "cd /usr/include\nfile=sys/stat.h\nif ( tes...ho\necho ShElL-OuTpUt-HaS-bEeN-c
OmPlEtEd\n"
190:2504b2a0,read2,159: "cd /usr/include\nfile=sys/stat.h\nif ( tes...echo\necho ShElL-OuTpUt-HaS-bEeN-
cOmPlEtE"
190:2504b0c0,write2,6: "FALSE\n"
189:2504b0c0,read2,6: "FALSE\n"
190:2504b2a0,read2,2: "d\n"


so proc 190 reads the following:


cd /usr/include
file=sys/stat.h
if ( test  -r types/vxTypesOld.h ) > /dev/null 2>&1
then echo TRUE
else echo FALSE
fi

echo
echo ShElL-OuTpUt-HaS-bEeN-cOmPlEtE


but there is no 'd\n' at the end of that last line.  Proc 190 does the test,
echoes "FALSE\n", and then goes back to look for more input.  It picks up the
'd\n' and goes trying to find /bin/d, or whatever.  Hence the output we see of


/bin/sh: d: command not found                               



So, I created a /bin/d which contained


#!/bin/sh
echo ShElL-OuTpUt-HaS-bEeN-cOmPlEtEd


and my test script then runs to completion.  The test script is the one
Alan posted, which just runs fixincl on sys/stat.h.

Note that the child only sends "FALSE\n", it doesn't send another "\n",
which should preceed the ShElL-... line.  So, the child is most likely
loosing "echo\necho ShElL-OuTpUt-HaS-bEeN-cOmPlEtE".  41 chars, which is
exactly what Alan reported in the first place.

We do now know that the data is being fed to copy_to_user() in pipe_read(),
and strace shows it is really copied to the users buffer, but it
apparently isn't being seen by the shell on its stdin.

I added more debug to look at buffer alignments, but that didn't show
anything interesting:

Parent write of 161 chars, kernel buffer 0x1dae4000, user buffer 0x4001d000
Child read of 159 bytes,   kernel buffer 0x1dae4000, user buffer 0x00085810

Child input seems to have got lost after 159-41=118 (0x76) chars, or
at child buffer address 0x85886.

So, I used gdb to attach to the stuck child and looked in its buffer:

0x85810:        100 'd' 10 '\n' 32 ' '  47 '/'  117 'u' 115 's' 114 'r' 47 '/'
0x85818:        105 'i' 110 'n' 99 'c'  108 'l' 117 'u' 100 'd' 101 'e' 10 '\n'
0x85820:        102 'f' 105 'i' 108 'l' 101 'e' 61 '='  115 's' 121 'y' 115 's'
0x85828:        47 '/'  115 's' 116 't' 97 'a'  116 't' 46 '.'  104 'h' 10 '\n'
0x85830:        105 'i' 102 'f' 32 ' '  40 '('  32 ' '  116 't' 101 'e' 115 's'
0x85838:        116 't' 32 ' '  32 ' '  45 '-'  114 'r' 32 ' '  116 't' 121 'y'
0x85840:        112 'p' 101 'e' 115 's' 47 '/'  118 'v' 120 'x' 84 'T'  121 'y'
0x85848:        112 'p' 101 'e' 115 's' 79 'O'  108 'l' 100 'd' 46 '.'  104 'h'
0x85850:        32 ' '  41 ')'  32 ' '  62 '>'  32 ' '  47 '/'  100 'd' 101 'e'
0x85858:        118 'v' 47 '/'  110 'n' 117 'u' 108 'l' 108 'l' 32 ' '  50 '2'
0x85860:        62 '>'  38 '&'  49 '1'  10 '\n' 116 't' 104 'h' 101 'e' 110 'n'
0x85868:        32 ' '  101 'e' 99 'c'  104 'h' 111 'o' 32 ' '  84 'T'  82 'R'
0x85870:        85 'U'  69 'E'  10 '\n' 101 'e' 108 'l' 115 's' 101 'e' 32 ' '
0x85878:        101 'e' 99 'c'  104 'h' 111 'o' 32 ' '  70 'F'  65 'A'  76 'L'
0x85880:        83 'S'  69 'E'  10 '\n' 102 'f' 105 'i' 10 '\n' 10 '\n' 101 'e'
0x85888:        99 'c'  104 'h' 111 'o' 10 '\n' 101 'e' 99 'c'  104 'h' 111 'o'
0x85890:        32 ' '  83 'S'  104 'h' 69 'E'  108 'l' 76 'L'  45 '-'  79 'O'
0x85898:        117 'u' 84 'T'  112 'p' 85 'U'  116 't' 45 '-'  72 'H'  97 'a'
0x858a0:        83 'S'  45 '-'  98 'b'  69 'E'  101 'e' 78 'N'  45 '-'  99 'c'
0x858a8:        79 'O'  109 'm' 80 'P'  108 'l' 69 'E'  116 't' 69 'E'  85 'U'
0x858b0:        85 'U'  85 'U'  85 'U'  0 '\000'        0 '\000'        0 '\000'

The data is all there, so now the problem looks like a corrupt return value
from the read().  Should have got 0x9f, appears to have got 0x76.  Except
strace and my kernel debug shows the return value of 0x9f.

Perhaps we should rebuild bash and see if that helps.

Richard
