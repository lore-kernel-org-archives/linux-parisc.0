From: John David Anglin <dave@hiauly1.hia.nrc.ca>
Subject: Re: Problem with early startup in dynamic linker.
Date: Thu, 12 Nov 2009 15:55:57 -0500
Message-ID: <20091112205557.GA29804@hiauly1.hia.nrc.ca>
References: <119aab440911110634oe4a8eb2m8ff519055e7fbdf5@mail.gmail.com> <20091111164114.01AE3515C@hiauly1.hia.nrc.ca> <119aab440911120940h49107d53oad1e0dc8f91f797c@mail.gmail.com>
Reply-To: John David Anglin <dave.anglin@nrc-cnrc.gc.ca>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: dave.anglin@nrc-cnrc.gc.ca, libc-ports@sourceware.org,
	hongjiu.lu@intel.com, linux-parisc <linux-parisc@vger.kernel.org>
To: Carlos O'Donell <carlos@systemhalted.org>
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <119aab440911120940h49107d53oad1e0dc8f91f797c@mail.gmail.com>
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On Thu, 12 Nov 2009, Carlos O'Donell wrote:

> local =
>   {
>     .root = &local.boot_table,

Another approach might be to change this to an offset from a symbol
that you can load with the pc-relative trick.  This is what we do
for dwarf2 code and data symbols.  This gets rid of the relocation.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
