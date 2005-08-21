From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sun, 21 Aug 2005 23:53:39 +0800
Message-ID: <4308A383.8090704@tausq.org>
References: <200508201751.j7KHpqIH017505@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: parisc-linux@lists.parisc-linux.org
To: John David Anglin <dave@hiauly1.hia.nrc.ca>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200508201751.j7KHpqIH017505@hiauly1.hia.nrc.ca>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> I found that Process_3.exe was generating unaligned exceptions.  This
> was a result of a new macro define being added to libjava
> (UNWRAP_FUNCTION_DESCRIPTOR).  This macro was incorrectly doing function
> pointer canonicalization resulting in the unaligned exceptions.  I was
> testing a fix for this when I got the above hang.

Process_3.exe was causing unaligned traps, but it was not the process 
running when the system hung, right?

> I have the feeling that there is at least one more circumstance where
> handle_exceptions can loop.

In this case, when the machine hung, was it the same as before, where it 
will still respond to sysrq and pings?

In the previous case (stack overflow), I was able to debug this further 
by running the hanging process in the background (i.e. ./cc1plus ... &). 
Now when it hangs, I was still able to use the console and run strace on 
it. I wonder if you ran the gcc testsuite in the background, will the 
machine still respond sufficiently when it is "hung" that you can do 
some more debugging? strace should tell you if you are having another 
signal loop.

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
