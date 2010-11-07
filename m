From: "John David Anglin" <dave@hiauly1.hia.nrc.ca>
Subject: Re: HPMC in lba_pat_out8 on rp3440
Date: Sun, 7 Nov 2010 14:31:56 -0500 (EST)
Message-ID: <20101107193156.F14EF4E1C@hiauly1.hia.nrc.ca>
References: <20101104153507.GA7198@lackof.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Cc: dave.anglin@nrc-cnrc.gc.ca, grundler@parisc-linux.org,
	linux-parisc@vger.kernel.org
To: grundler@parisc-linux.org (Grant Grundler)
Return-path: <linux-parisc-owner@vger.kernel.org>
In-Reply-To: <20101104153507.GA7198@lackof.org> from "Grant Grundler" at Nov 4, 2010 09:35:08 am
List-ID: <linux-parisc.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

> Sorry...I had written the questions while going through the email
> and then forgot to delete them when I finished reading everything.

No problem.

> In short, I'm skeptical this is a problem in lba_pci code.
> Much more likely to be a driver issue or possibly HW issue.
> I was pointing at the configs that booted on ion/ioz only to
> help rule out driver or HW issues. Feel free to use ion for
> testing this.

I agree.  I think the hpmc in the lba_pci code and the hpmc with
LBA debug messages enabled are likely related.  Do you have any idea
how the code could avoid shooting itself in the foot?

Do you think there is a SMP race in setting up the PCI bus.  I was
thinking of trying an identical UP build.  I believe that all processors
are enabled at the time the hpmc occurs.

While there might be a hardware problem, the machine consistently boots
2.6.26-2-parisc64-smp without problems.  Until I lost the hard drive,
it was also running a 2.6.34 kernel.  The debian kernels tend to have
everything but the kitchen sink enabled.  I may have an older version
of this config still around.

I did update all the firmware on the machine a couple of months
ago.  This definitely helped with various memory corruption issues
that were occuring at boot time.  I believe that HP listed the
patch as critical.  Anyway, there's a chance that this changed
some of PDC responses.

> Also, if there are any add-on PCI cards in the machine, consider
> removing them.

I will take a look in the machine when I get back from Costa Rica
at the end of the week.  I think there may be one or two scsi
controllers.  There is also a radion card in it somewhere.

Thanks for you help in trying to narrow this down,
Dave

> thanks,
> grant
> --
> To unsubscribe from this list: send the line "unsubscribe linux-parisc" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 


-- 
J. David Anglin                                  dave.anglin@nrc-cnrc.gc.ca
National Research Council of Canada              (613) 990-0752 (FAX: 952-6602)
