Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
To: Bruno Vidal <bruno_vidal@hpfrcu03.france.hp.com>
Cc: "parisc-linux@lists.parisc-linux.org" <parisc-linux@lists.parisc-linux.org>
Subject: Re: [parisc-linux] How retrieving HPA/SPA with the device node 
In-Reply-To: Message from Grant Grundler <grundler@dsl2.external.hp.com>
   of "Tue, 02 Apr 2002 09:44:17 MST." <20020402164417.6C6B6482A@dsl2.external.hp.com>
References: <3CA9BB50.1FCEBDF4@admin.france.hp.com>  <20020402164417.6C6B6482A@dsl2.external.hp.com> 
Date: Tue, 02 Apr 2002 09:50:01 -0700
From: Grant Grundler <grundler@dsl2.external.hp.com>
Message-Id: <20020402165002.EF49B482A@dsl2.external.hp.com>
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

Grant Grundler wrote:
> Since several of the data structures are intended to be private,
> I suggest adding a function to sd.c (or scsi.c) that finds and returns
> the pci_dev pointer:

Well, looks like we *almost* have what we want in scsi_ioctl.c.
scsi_ioctl_get_pci() does about the same thing.
Maybe the right answer is to write another ioctl call that
does what you want. I don't know.

grant
