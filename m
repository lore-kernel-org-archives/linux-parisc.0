Return-Path: <owner-parisc-linux@dsl2.external.hp.com>
Date: Tue, 29 Jul 2003 15:32:35 -0600
From: Grant Grundler <grundler@parisc-linux.org>
To: Diego Francisco de Gastal Morales <Morales@tj.rs.gov.br>
Cc: parisc-linux@lists.parisc-linux.org
Subject: Re: [parisc-linux] eisa nic: intel 82556. Driver?
Message-ID: <20030729213235.GF22989@dsl2.external.hp.com>
References: <41001F95FE172B4593DE6F50CAAF2D581AA227@mailserver.tj.rs.gov.br>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <41001F95FE172B4593DE6F50CAAF2D581AA227@mailserver.tj.rs.gov.br>
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

On Mon, Jul 28, 2003 at 04:55:25PM -0300, Diego Francisco de Gastal Morales wrote:
> 	I just installed linux on a HP9000/D280. It's all fine,
> except the machine has two eisa fast ethernet cards, with intel 82556
> chipset, and I can't make it work.

No EISA cards which require DMA will work (yet).
Wax (EISA bus controller) docs haven't been published and a non-coherent
IOMMU (have I got that right, James?) needs to be programmed for DMA.

It's likely someone from inside HP will have to write that code
since it's gotten alot harder to publish stuff.

grant
