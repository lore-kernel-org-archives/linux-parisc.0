From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] Re: [PATCH] Common compat_sys_sysinfo
Date: Mon, 08 Jan 2007 07:27:30 +0800
Message-ID: <45A181E2.9020609__16952.7263533839$1416624258$gmane$org@tausq.org>
References: <20070107144850.GB3207@athena.road.mcmartin.ca>	<20070107151319.GA23478@infradead.org>	<20070107151817.GN24620@parisc-linux.org>	<119aab440701071422x2041a7b9lf5361c15a001d954@mail.gmail.com>
	<20070107223130.GR24620@parisc-linux.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: Kyle McMartin <kyle@mcmartin.ca>,
 parisc-linux <parisc-linux@lists.parisc-linux.org>
To: Matthew Wilcox <matthew@wil.cx>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070107223130.GR24620@parisc-linux.org>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

>> I'm sure this has been proposed by someone else?
> 
> That seems like the same as my suggestion, except for the spelling
> (syscall vs packed_args).  Did I miss something?

If you change this now, wouldn't it break existing binaries? I hope we 
don't end up with some syscalls using one convention and others using a 
different convention...

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
