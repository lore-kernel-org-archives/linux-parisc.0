Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Jeremy Drake <jeremyd@apptechsys.com>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] 2.4.18 SMP instability 
In-Reply-To: Message from Jeremy Drake <jeremyd@apptechsys.com>
   of "Mon, 03 Jun 2002 14:58:11 PDT." <Pine.LNX.4.44.0206031455490.24659-100000@garibaldi.apptechsys.com>
References: <Pine.LNX.4.44.0206031455490.24659-100000@garibaldi.apptechsys.com> 
Date: Wed, 05 Jun 2002 15:24:15 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020605212415.57F93482A@dsl2.external.hp.com>
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

Jeremy Drake wrote:
> Here it is...  BTW, maybe you could explain how to interpret these, so I 
> don't have to send you all of this...

Generally, look at IOA offset and GR02 to see where it died.
If it's not a kernel address, start trying to figure out what it is.
Lots more magic in the PIM dump that I don't understand either.

In this HPMC dump, I don't know where 0x19bf0 is...

The firmware on the workstations tries to give a high level decoding
of the error:
> A Data I/O Fetch Timeout occurred while CPU 0 was
> requesting information from a device at the path 10/0/15/1 (built-in PCI devi
>   ce).
> 
> 
> Memory/IO Controller Error Analysis Information:
> 
> The Memory/IO Controller only observed the Broadcast Error.  It did not log
> any additional information about the HPMC.


This typically means something in the IO path didn't respond
to a CPU read.

grant
