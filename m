From: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH] parisc/PCI: lba: fix: convert to pci_create_root_bus()
 for correct root bus resources
Date: Sun, 02 Jun 2013 00:03:16 +0200
Message-ID: <51AA6FA4.3000900@gmx.de>
References: <20130530141033.GA3665@ls3530.box> <CAErSpo69AxKgz8Dg8+T7n5jsuOzdSoCUstqrX+uUh8TZ08ayqg@mail.gmail.com> <51A7ACBF.4030601@gmx.de> <20130530211244.GA28735@google.com> <51A7C763.4080704@gmx.de> <51A90C21.7010602@gmx.de> <CAErSpo6oX4ADT39_ya_PbHhkQ=i_TaT+hwfrh6qXDn2xCEnx7w@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-parisc@vger.kernel.org,
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>
To: Bjorn Helgaas <bhelgaas@google.com>
Return-path: <linux-pci-owner@vger.kernel.org>
In-Reply-To: <CAErSpo6oX4ADT39_ya_PbHhkQ=i_TaT+hwfrh6qXDn2xCEnx7w@mail.gmail.com>
List-ID: <linux-pci.vger.kernel.org>
List-Id: linux-parisc.vger.kernel.org

On 05/31/2013 11:25 PM, Bjorn Helgaas wrote:
>>>> Maybe it has devices that aren't
>>>> officially supported and the firmware did the wrong thing?  (Though it'd
>>>> still be nice if Linux did something more sensible than this.)
>>
>> Ok, I removed all unnecessary cards, incl. 100MBit NIC, 1000MBit NIC, Matrox G200 and a Visualize FX.
>>
>> Now it works nicely and as expected.
>> Even the Visualize EG graphics card and the Voodo2 work (which were my main problem) :-)
> 
> Good, glad that works.  We *ought* to be able to do better, e.g., by
> just ignoring cards that we can't use.
> 
> If you have a chance, you might collect the complete dmesg log from
> both the working configuration and the broken one, and attach them to
> a new kernel.org PCI bugzilla. 

I opened bugzilla #59191
https://bugzilla.kernel.org/show_bug.cgi?id=59191
(Someone needs to reassign this bug to Driver/PCI component - I can't.)

Thanks!
Helge
