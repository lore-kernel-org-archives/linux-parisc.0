Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Randolph Chung <randolph@tausq.org>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] SMP kernel problems on a D350 
In-Reply-To: Message from Randolph Chung <randolph@tausq.org>
   of "Sat, 21 Sep 2002 16:20:18 PDT." <20020921232018.GA29388@tausq.org>
References: <20020920203724.GD24622@systemhalted> <200209202046.g8KKkGwj019921@hiauly1.hia.nrc.ca> <20020920205012.GF4909@tausq.org> <20020920205518.GB25844@systemhalted>  <20020921232018.GA29388@tausq.org> 
Date: Sat, 21 Sep 2002 18:57:14 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020922005714.07CB24829@dsl2.external.hp.com>
Sender: parisc-linux-admin@lists.parisc-linux.org
Errors-To: parisc-linux-admin@lists.parisc-linux.org
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux/>

Randolph Chung wrote:
> legolas:/home/randolph# cat /proc/sys/kernel/unaligned 
> Unaligned trap handler is enabled
> legolas:/home/randolph# ./t; echo $?
> 0
> legolas:/home/randolph# echo 0 >> /proc/sys/kernel/unaligned 

Cool!
After reviewing the diff (on ftp.p-l.o/patches), only two nits
that have nothing to do with the code:

o cat output should relate to what I have to "echo" into the /proc file.
  ie only display '0' or '1' when catting.
  Or is "blah is enabled" by convention?

o SYSCTL_FILENAME should be "sys/kernel/unaligned_trap"
  and then I think 0 or 1 should be clear enough to anyone
  daring to mess with it.


> if someone can review this real quick before i commit it to cvs,

If you don't like my suggestions, I'm ok with committing
what you've already got.

> i'd
> appreciate it. in particular, the point where it decides that the
> unaligned trap is not enabled and forces the SIGBUS is not exactly at
> the beginning of the trap handler -- it still prints the unaligned
> message.... 

hmmm...if running under a debugger, one gets that info anyway.
But that's not always easy to do. I think it's ok since we don't
like to see unligned traps happen anyway.

Maybe a "unaligned_trap_msg" tunable?
/me runs...

thanks
grant
