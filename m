From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: threads and fork on machine with VIPT-WB cache
Date: Thu, 15 Apr 2010 18:35:18 -0400
Message-ID: <20100415223517.GA6360@hiauly1.hia.nrc.ca>
References: <20100412214118.46D925160@hiauly1.hia.nrc.ca> <20100413115501.307040@gmx.net>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-parisc@vger.kernel.org, gniibe@fsij.org,
	carlos@systemhalted.org, dave.anglin@nrc-cnrc.gc.ca
To: Helge Deller <deller@gmx.de>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20100413115501.307040@gmx.net>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Tue, 13 Apr 2010, Helge Deller wrote:

> Still crashes.

After thinking about this some more, I believe out updating of pte's
is broken.  We have a lock, pa_dbit_lock, but this is only used in
the dbit traps.  Even there, the implementation is flawed on SMP
machines.

The fundamental issue is a pte can't be updated in one instruction.
The old pte has to be loaded, modified, and then written back to
memory.  It this isn't made atomic with a lock, we drop write protect,
dirty, and accessed bits occassionally.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
