From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [RFC] Revamp exception handling in the kernel
Date: Sat, 11 Sep 2004 18:49:45 -0400 (EDT)
Message-ID: <200409112249.i8BMnjCA006552@hiauly1.hia.nrc.ca>
References: <20040911165325.GO28659@tausq.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: randolph@tausq.org
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20040911165325.GO28659@tausq.org> from "Randolph Chung" at Sep
	11, 2004 12:53:25 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> [1] The change to using absolute jumps is because gas doesn't want to
> let us take the difference of labels in two different sections (viz.
> .text vs .fixup). jejb and I are not able to come up with a case where
> using relative jumps is required.

Right.  However, there is a way to do 32/64 bit pc-relative offsets.
The table entries need to look like "L$1+(.+8-L$0)-$PIC_pcrel$0".
GAS needs to be reasonably new to support this.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
