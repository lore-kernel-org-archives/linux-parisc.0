From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] [patch] GCC generates incorrect mfctl instruction
Date: Wed, 31 Jan 2007 09:33:54 -0500 (EST)
Message-ID: <200701311433.l0VEXt9P025475__12089.5103006207$1416624272$gmane$org@hiauly1.hia.nrc.ca>
References: <20070131094336.dfaa715c.gmsoft@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: gmsoft@gentoo.org (Guy Martin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070131094336.dfaa715c.gmsoft@gentoo.org> from "Guy Martin" at
	Jan 31, 2007 09:43:36 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> This patch removes the ,w completer of the mfctl instruction when not used with cr11.
> Only cr11 needs the ,w completer on PA2.0.

Thanks, I'll install the change.  It might not get into 4.1.2 as
the 4.1 branch is currently frozen for release.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
