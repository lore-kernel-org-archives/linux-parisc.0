From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [gcc] should we teach gcc some new tricks?
Date: Tue, 3 May 2005 15:00:33 -0400 (EDT)
Message-ID: <200505031900.j43J0XXG005722@hiauly1.hia.nrc.ca>
References: <426F252F00002E4D@mail-1-bnl.tiscali.it>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: lamont@debian.org,
 parisc-linux@lists.parisc-linux.org
To: soete.joel@tiscali.be (Joel Soete)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <426F252F00002E4D@mail-1-bnl.tiscali.it> from "Joel Soete" at May
	3, 2005 05:58:03 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> 102f3ac8:       eb 0e bf 35     b,l 10111a68 <__canonicalize_funcptr_for_compare>,%r2
> 10380978 <__ksymtab___canonicalize_funcptr_for_compare>:
> 1038542c <__kstrtab___canonicalize_funcptr_for_compare>:
> 
> this one doesn't seems to help me to get rid of those call __canonicalize_funcptr_for_compare().

The only way to get rid of the calls is to not compare function pointers ;)

> Do you think that gcc-4.0 final release will help more?

No.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
