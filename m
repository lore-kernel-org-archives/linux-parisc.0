Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 7BFF6482B
	for <parisc-linux@lists.parisc-linux.org>; Mon, 26 Aug 2002 05:53:47 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.33 #5)
	id 17jIRC-00018a-00; Mon, 26 Aug 2002 12:53:42 +0100
Date: Mon, 26 Aug 2002 12:53:42 +0100
From: Matthew Wilcox <willy@debian.org>
To: Ryan Bradetich <rbradetich@uswest.net>
Cc: parisc-linux@lists.parisc-linux.org
Message-ID: <20020826125342.B6931@parcelfarce.linux.theplanet.co.uk>
References: <1030332635.19524.5.camel@beavis>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1030332635.19524.5.camel@beavis>; from rbradetich@uswest.net on Sun, Aug 25, 2002 at 09:30:35PM -0600
Subject: [parisc-linux] Re: [parisc-linux-cvs] Serial MUX driver update.
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

On Sun, Aug 25, 2002 at 09:30:35PM -0600, Ryan Bradetich wrote:
> Update to the serial mux driver.
>  static struct parisc_device_id mux_tbl[] = {
>  	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, 0x015, 0x0000D }, /* Eole CAP/MUX */
> +	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, 0x044, 0x0000D }, /* Sahp Baat Kiuh AP/MUX */
>  	{ 0, }
>  };

May I suggest:

static struct parisc_device_id mux_tbl[] = {
	{ HPHW_A_DIRECT, HVERSION_REV_ANY_ID, HVERSION_ANY_ID, 0x0000D }, 
	{ 0, }
};

since this driver should work for all MUXes, not just Eole & SBK.

By and large, everyone should have HVERSION_ANY_ID in their
parisc_device_id tables.  There's some exceptions (ccio, astro, elroy,
dino, serial), but most drivers shouldn't need to discriminate on
hversion.

-- 
Revolutions do not require corporate support.
