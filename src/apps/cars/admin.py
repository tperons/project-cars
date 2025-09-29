from django.contrib import admin

from src.apps.cars.models import Brand, Car, CarImages, CarInventory, Optional


class CarImageInline(admin.StackedInline):
    model = CarImages


@admin.register(Brand)
class BrandAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name',)
    list_display_links = ('name',)
    ordering = ('name',)


@admin.register(Optional)
class OptionalAdmin(admin.ModelAdmin):
    list_display = ('pk', 'name',)
    list_per_page = 25
    ordering = ('name',)
    search_fields = ('name',)


@admin.register(Car)
class CarAdmin(admin.ModelAdmin):
    actions = ('mark_as_sold',)
    autocomplete_fields = ('optionals',)
    inlines = (CarImageInline,)
    list_display = ('pk', 'brand', 'model', 'year', 'value', 'created_at', 'status', 'get_owner_name',)
    list_display_links = ('model',)
    list_editable = ('status',)
    ordering = ('status', 'model',)

    @admin.action(description='Marcar como Vendido')
    def mark_as_sold(self, request, queryset):
        rows_updated = queryset.update(status=Car.Status.SOLD)
        if rows_updated == 1:
            message = "1 carro foi marcado como vendido."
        else:
            message = f"{rows_updated} carros foram marcados como vendidos."
        self.message_user(request, message)

    @admin.display(description='Responsável', ordering='owner__first_name')
    def get_owner_name(self, obj: Car) -> str:
        if obj.owner:
            return obj.owner.first_name or obj.owner.username
        return "N/A"


@admin.register(CarInventory)
class CarInventoryAdmin(admin.ModelAdmin):
    list_display = ('cars_count', 'cars_value', 'created_at',)
    ordering = ('-pk',)
