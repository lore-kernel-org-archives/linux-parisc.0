Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node 
In-Reply-To: Message from Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
   of "Mon, 03 Jun 2002 13:04:10 +0200." <3CFB4D2A.F86BEDC4@admin.france.hp.com>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com> <20020402164417.6C6B6482A@dsl2.external.hp.com>  <3CFB4D2A.F86BEDC4@admin.france.hp.com> 
Date: Mon, 03 Jun 2002 14:38:19 -0600
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020603203819.DB7084831@dsl2.external.hp.com>
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

Bruno Vidal wrote:
> Can someone can explain what is the difference between the
> "hpa" of a scsi card (pci or not) and the "base" in the structure Scsi_Host ?

hpa and base are "handles" for different views of HW.
"hpa" doesn't have to be a physical address (though it normally is).
On V-class, the hpa is bogus and just a reference to particular IO device.
base could be "adjusted" (like the LASI example) or "F-extended"
for 64-bit or whatever the platform code thinks the driver needs
to reference the device properly.

But in practice, for the platforms we support to date, I think you
can compare them (or compare most of the bits) to determine
if it's the same device.

grant
