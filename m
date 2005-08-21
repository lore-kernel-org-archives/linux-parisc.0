From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] Latest 2.6.13-rc6-pa2 test pr :_(
Date: Sun, 21 Aug 2005 12:46:38 -0400 (EDT)
Message-ID: <200508211646.j7LGkcJa022512@hiauly1.hia.nrc.ca>
References: <4308A383.8090704@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org (Randolph Chung)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <4308A383.8090704@tausq.org> from "Randolph Chung" at Aug 21,
	2005 11:53:39 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Process_3.exe was causing unaligned traps, but it was not the process 
> running when the system hung, right?

I'm not sure.  It was the last test run in the log but this isn't a
reliable indication.

I installed a GCC fix last night which fixes Process_3.exe, so it doesn't
generate the unaligned faults anymore.  The fixes stack traces under
java.  However, there's still a problem when gij is used (PR libgcj/21692).
I haven't figured out how to debug this.

> In this case, when the machine hung, was it the same as before, where it 
> will still respond to sysrq and pings?

I'm not sure about sysrq but the machine was still responding to pings.

> In the previous case (stack overflow), I was able to debug this further 
> by running the hanging process in the background (i.e. ./cc1plus ... &). 
> Now when it hangs, I was still able to use the console and run strace on 
> it. I wonder if you ran the gcc testsuite in the background, will the 
> machine still respond sufficiently when it is "hung" that you can do 
> some more debugging? strace should tell you if you are having another 
> signal loop.

I actually run GCC builds and the testsuite in the background all
the time.  So, it's definitely possible to do this from the console.
Problem is the machine is downtown at NRC and it's not setup with a
serial console.  I know from past experience that ssh connections die.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
