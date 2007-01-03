From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA8800 Status (Happy New Year)
Date: Wed, 3 Jan 2007 13:58:16 -0500 (EST)
Message-ID: <200701031858.l03IwHfL004053__24210.1593678401$1416624251$gmane$org@hiauly1.hia.nrc.ca>
References: <20070103072418.GE702@colo.lackof.org>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070103072418.GE702@colo.lackof.org> from "Grant Grundler" at
	Jan 3, 2007 00:24:18 am
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Right now, I don't trust the backtrace. *sigh*

I've commented it out for the moment.  Since I rebuilt 2.6.20-rc2
last night with Helge's timer change, the machine has rebuilt GCC
and got through the gcc (C) testsuite.  However, expect hung at the
end.  I've reported this before.

So far, I've just tried UP kernels.

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
