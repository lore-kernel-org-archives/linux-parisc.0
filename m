Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: John <hplinux@eagle.grdl.noaa.gov>
Cc: parisc-linux@parisc-linux.org
In-Reply-To: Message from John <hplinux@eagle.grdl.noaa.gov>
   of "Thu, 14 Mar 2002 15:41:18 EST." <3C910AEE.6AB2235E@eagle.grdl.noaa.gov>
References: <3C7D115C.9AEE5DDB@eagle.grdl.noaa.gov> <20020227172844.2534F485A@dsl2.external.hp.com> <3C7D1C89.121A1B30@eagle.grdl.noaa.gov> <20020227183818.6A427482B@dsl2.external.hp.com> <3C8D1B6F.162195CF@eagle.grdl.noaa.gov> <20020312171650.7AF54484A@dsl2.external.hp.com>  <3C910AEE.6AB2235E@eagle.grdl.noaa.gov> 
Date: Thu, 14 Mar 2002 21:45:46 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020315044546.C7D58483E@dsl2.external.hp.com>
Subject: [parisc-linux] Re: PA-RISC 0.9.3+C200+Visualize-EG+2.4.18-pa05 = working X!
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

John wrote:
> I wanted to share the good news that Grant's recent patch to "entry.S"
...
> Thanks Grant!

That's great news!

But Thomas Bogendoerf should get most of the credit for figuring
out the problem and fix. I just implemented what he said.

BTW, I've modified the patch a bit (removed an un-needed depdi)
and it's still not committed yet. I'd like to let Thomas
commit it himself since he really did the hard part.

grant
