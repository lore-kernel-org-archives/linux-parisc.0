From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: [parisc-linux] PA glibc nls bug
Date: Sun, 22 Apr 2007 12:33:41 -0400 (EDT)
Message-ID: <200704221633.l3MGXfI9016785__18633.8669890121$1416624341$gmane$org@hiauly1.hia.nrc.ca>
References: <200704221615.l3MGFndK016423@hiauly1.hia.nrc.ca>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=US-ASCII
Cc: parisc-linux@lists.parisc-linux.org
To: dave@hiauly1.hia.nrc.ca (John David Anglin)
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <200704221615.l3MGFndK016423@hiauly1.hia.nrc.ca> from "John David
	Anglin" at Apr 22, 2007 12:15:49 pm
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> Yesterday, I was looking for something PA specific and not having
> much success.  Now that we know that this is a generic problem, I would
> file a Debian PR and look through recent changes to the locale files.

+  * Add patches/localedata/locale-zh_TW.diff: Remove <U897F><U5143> from
+    dates.  Thanks Dan Jacobson (Closes: #352600)

Dave
-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
