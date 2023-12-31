﻿using Logic.Common;
using Microsoft.EntityFrameworkCore;

namespace Logic.SnackMachines;

public class SnackMachineRepository : Repository<SnackMachine>
{
    public SnackMachineRepository(ApplicationDbContext context) : base(context)
    {
    }

    public override SnackMachine? GetById(long id)
    {
        var snacks = Context.SnackMachines
            .Include(x => x.Slots)
            .ThenInclude(x => x.SnackPile)
            .ThenInclude(x => x.Snack)
            .ToList();

        return snacks.Single(x => x.Id == id);
    }

    public IReadOnlyList<SnackMachineDto> GetSnackMachineList()
    {
        return Context.SnackMachines.AsNoTracking()
            .Select(s =>
                new SnackMachineDto(s.Id, s.MoneyInside.Amount))
            .ToList();
    }
}