Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Received: from www.linux.org.uk (parcelfarce.linux.theplanet.co.uk [195.92.249.252])
	by dsl2.external.hp.com (Postfix) with ESMTP id 5C532482A
	for <parisc-linux@parisc-linux.org>; Tue, 21 Aug 2001 18:50:05 -0600 (MDT)
Received: from willy by www.linux.org.uk with local (Exim 3.13 #1)
	id 15ZMDa-0003zD-00; Wed, 22 Aug 2001 01:50:02 +0100
Date: Wed, 22 Aug 2001 01:50:02 +0100
From: Matthew Wilcox <willy@debian.org>
To: Grant Grundler <grundler@puffin.external.hp.com>
Cc: Matthew Wilcox <willy@debian.org>, parisc-linux@parisc-linux.org
Subject: Re: [parisc-linux] iotree thoughts
Message-ID: <20010822015002.F21643@parcelfarce.linux.theplanet.co.uk>
References: <willy@debian.org> <200108210544.XAA20603@puffin.external.hp.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <200108210544.XAA20603@puffin.external.hp.com>; from grundler@puffin.external.hp.com on Mon, Aug 20, 2001 at 11:44:20PM -0600
Sender: <willy@www.linux.org.uk>
List-ID: <linux-parisc.vger.kernel.org>

On Mon, Aug 20, 2001 at 11:44:20PM -0600, Grant Grundler wrote:
> Matthew Wilcox wrote:
> > On Thu, Aug 09, 2001 at 09:06:43AM -0600, Grant Grundler wrote:
> > > Yes. AFAIK, LASI sub-devices are listed by PDC. For Dino HPUX makes
> > > a special hvers PDC call. Need to look at the HPUX code or Raven PDC ERS.
> > 
> > If you could dig those out for me, that'd be great.  I'm not familiar with
> > the layout of the HPUX source tree yet.
> 
> That sounds too much like work. ;^)
> Raven PDC ERS is available from HP's firmware team website. (internal only).

I looked through the Raven ERS, it wasn't too helpful.  I managed to find
the Dino driver in the HPUX source tree.... it doesn't seem to make the
call itself, but instead:

    /*
     * Loop thru the fixed_mod_table looking for a fixed module
     * that is a child of Dino.  Start at whatever index we just
     * figured out from the hardware path of the last module found.
     */
    for(; idx < nfixed_modules; idx++) {
        entry = &fixed_mod_table[idx];
        
        if (is_child_of(entry, parent_path))
        {
#ifdef RDB
            /*
             * Ignore the serial port if RDB is using it.
             */
            if ((entry != NULL) && (!(IS_RDB_DEVICE(entry->reg_set))))
#endif
                    return entry;
        }
        /* else not a child of dino - loop again */
    }

    /*
     * If we exit the loop without returning anything, we must not
     * have found the rs232 entry in the FMT.  The rs232 is not to
     * be used in this system, so return NULL
     */
    return NULL;

So it seems to me that we shouldn't do bus-walks underneath Dino, but
rely on PDC telling us about the device if it's attached.

-- 
Revolutions do not require corporate support.
