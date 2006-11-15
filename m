From: Grant Grundler <grundler@parisc-linux.org>
Subject: Re: [parisc-linux] LBA PCI : avoid crash when pluging a pcmcia bridge
Date: Wed, 15 Nov 2006 01:00:22 -0700
Message-ID: <20061115080022.GB30664@colo.lackof.org>
References: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
Mime-Version: 1.0
Content-Type: text/plain;
  charset=us-ascii
Cc: parisc-linux@lists.parisc-linux.org
To: Guy Martin <gmsoft@tuxicoman.be>
Return-Path: <parisc-linux-bounces@lists.parisc-linux.org>
In-Reply-To: <20061108150706.bb658b27.gmsoft@tuxicoman.be>
List-Id: parisc-linux developers list <parisc-linux.lists.parisc-linux.org>
List-Unsubscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=unsubscribe>
List-Archive: <http://lists.parisc-linux.org/pipermail/parisc-linux>
List-Post: <mailto:parisc-linux@lists.parisc-linux.org>
List-Help: <mailto:parisc-linux-request@lists.parisc-linux.org?subject=help>
List-Subscribe: <http://lists.parisc-linux.org/mailman/listinfo/parisc-linux>,
	<mailto:parisc-linux-request@lists.parisc-linux.org?subject=subscribe>
Errors-To: parisc-linux-bounces@lists.parisc-linux.org

On Wed, Nov 08, 2006 at 03:07:06PM +0100, Guy Martin wrote:
> Hi All,
> 
> Referencing this thread about a crash when there is a pcmcia bridge plugged in a C3600 :
> http://lists.parisc-linux.org/pipermail/parisc-linux/2006-October/030312.html
...
> it would be better to fix pci_scan_bus_parented() which returns NULL

Guy,

pci_scan_bus_parented() calls pci_create_bus() in order to allocate
the bus.   pci_create_bus() is obviously failing.

Can you add printks to each of the follow labels in pci_create_bus()
and printks for the first two "return NULL" statements?

It's ok if your tree also has the patch you proposed so it doesn't crash.

Code from drivers/pci/probe.c:pci_create_bus()
...
sys_create_link_err:
        class_device_remove_file(&b->class_dev, &class_device_attr_cpuaffinity);
class_dev_create_file_err:
        class_device_unregister(&b->class_dev);
class_dev_reg_err:
        device_unregister(dev);
dev_reg_err:
        down_write(&pci_bus_sem);
        list_del(&b->node);
        up_write(&pci_bus_sem);
err_out:
        kfree(dev);
        kfree(b);
        return NULL;
}

Once I know which error is occurring, then I can take
the next step towards investigating the problem.

thanks,
grant
_______________________________________________
parisc-linux mailing list
parisc-linux@lists.parisc-linux.org
http://lists.parisc-linux.org/mailman/listinfo/parisc-linux
