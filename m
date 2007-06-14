From: Randolph Chung <randolph@tausq.org>
Subject: Re: [parisc-linux] [patch] Disable parport autoprobing on !X86
Date: Thu, 14 Jun 2007 23:35:20 +0800
Message-ID: <46716038.9030007__22830.9388542131$1416624394$gmane$org@tausq.org>
References: <46715250.4050101@tausq.org>
	<20070614162812.5c0eea6b@the-village.bc.nu>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=ISO-8859-1;
  format=flowed
Cc: linux-parport@lists.infradead.org,
 parisc-linux@lists.parisc-linux.org
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20070614162812.5c0eea6b@the-village.bc.nu>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

> If io[0] is set the caller has specified a port to probe which seems like
> it shouldn't be ignored ?

if we do it that way, then it'll be trivial for root to machine check 
the box... is that ok?

randolph
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
